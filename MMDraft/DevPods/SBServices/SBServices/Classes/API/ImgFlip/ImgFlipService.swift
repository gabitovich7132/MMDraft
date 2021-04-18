//
//  ImgFlipService.swift
//  Alamofire
//
//  Created by Zhenis Mutan on 19.04.2021.
//

import MBCommon
import SBNetworking

public protocol ImgFlipServiceProtocol {
    @discardableResult
    func getMemes(successHandler: BlockObject<MemesResponse, Void>,
                  errorHandler: ErrorBlock) -> CancelableProtocol?
}

public class ImgFlipService: ImgFlipServiceProtocol {
    public typealias ServiceLocatorAlias = NetworkingManagerServiceLocator
    final public class ServiceLocator: ServiceLocatorAlias {
        public init() {}
    }
    
    private let networkingManager: NetworkingManagerProtocol
    
    public init(serviceLocator: ServiceLocatorAlias = ServiceLocator()) {
        networkingManager = serviceLocator.networkingManager()
    }
    
    public func getMemes(successHandler: BlockObject<MemesResponse, Void>,
                         errorHandler: ErrorBlock) -> CancelableProtocol? {
        let request = MemesGetRequest()
        return networkingManager.sendRequest(request: request,
                                             successBlock: successHandler,
                                             errorBlock: errorHandler)
    }
}
