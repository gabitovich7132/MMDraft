//
//  NetworkingManager.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import MBCommon
import Foundation

public protocol NetworkingManagerProtocol {
    func sendRequest<RESPONSE: ResponseProtocol>(request: RequestProtocol,
                                                 successBlock: BlockObject<RESPONSE, Void>,
                                                 errorBlock: ErrorBlock) -> CancelableProtocol?
}

public final class NetworkingManager: NetworkingManagerProtocol {
    public static let shared = NetworkingManager()
    
    public typealias ServiceLocator = NetworkSessionServiceLocator & URLTaskProcessorServiceLocator & DataTasksHolderServiceLocator & ReachabilityServiceLocator
    public final class ServiceLocatorImpl: ServiceLocator {
        public init() {}
    }
    
    private struct TaskConfiguration<RESPONSE: ResponseProtocol> {
        typealias SuccessBlock = BlockObject<RESPONSE, Void>
        
        let identifier: String
        let successBlock: SuccessBlock
        let errorBlock: ErrorBlock
        let cancelBlock: EmptyBlock
    }
    
    private let syncQueue: DispatchQueue
    private let tasksHolder: DataTasksHolderProtocol
    private let urlTaskProcessor: URLTaskProcessorProtocol
    private let reachability: ReachabilityProtocol.Type
    public var debugSchema: String = ""
    
    deinit {
        tasksHolder.cancelAll()
    }
    
    public init(serviceLocator: ServiceLocator = ServiceLocatorImpl(), syncQueue: DispatchQueue = .main) {
        self.syncQueue = syncQueue
        self.urlTaskProcessor = serviceLocator.taskProcessor(session: serviceLocator.networkSession())
        self.tasksHolder = serviceLocator.dataTasksHolder()
        self.reachability = serviceLocator.reachabilityService()
    }
    
    public func sendRequest<RESPONSE: ResponseProtocol>(request: RequestProtocol,
                                                        successBlock: BlockObject<RESPONSE, Void>,
                                                        errorBlock: ErrorBlock) -> CancelableProtocol? {
        guard let configuration: NetworkingManager.TaskConfiguration<RESPONSE> = taskConfiguration(request: request, successBlock: successBlock, errorBlock: errorBlock) else {
            return nil
        }
        
        let task = urlTaskProcessor.createTask(request: request,
                                               identifier: configuration.identifier,
                                               successBlock: configuration.successBlock,
                                               errorBlock: configuration.errorBlock,
                                               cancelBlock: configuration.cancelBlock)
                
        tasksHolder.add(task)
        _ = task?.resumeAndReturnSelf()
        
        return task
    }
    
    private func taskConfiguration<RESPONSE: ResponseProtocol>(request: RequestProtocol,
                                                               successBlock: BlockObject<RESPONSE, Void>,
                                                               errorBlock: ErrorBlock) -> TaskConfiguration<RESPONSE>? {
        guard reachability.isConnectedToNetwork() else {
            syncQueue.async {
                errorBlock.execute(NetworkingError.noConnection)
            }
            return nil
        }
        
        guard request.url != nil else {
            syncQueue.async {
                errorBlock.execute(NetworkingError.wrongURL)
            }
            return nil
        }
        
        let identifier = UUID().uuidString
        
        let successBlock = BlockObject<RESPONSE, Void> { [weak self] response in
            self?.tasksHolder.remove(identifier)
            self?.syncQueue.async {
                successBlock.execute(response)
            }
        }
        let errorBlock = ErrorBlock { [weak self] error in
            self?.tasksHolder.remove(identifier)
            self?.syncQueue.async {
                errorBlock.execute(error)
            }
        }
        let cancelBlock = EmptyBlock { [weak self] in
            self?.tasksHolder.cancel(identifier)
        }
        
        return TaskConfiguration(
            identifier: identifier,
            successBlock:
            successBlock,
            errorBlock: errorBlock,
            cancelBlock: cancelBlock
        )
    }
}
