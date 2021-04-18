//
//  DataTasksHolder.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import MBCommon

public protocol DataTasksHolderProtocol {
    func add(_ task: DataTaskProtocol?)
    func remove(_ identifier: String)
    func cancel(_ identifier: String)
    func cancelAll()
}

public final class DataTasksHolder: DataTasksHolderProtocol {
    private let dataTasksSyncQueue = DispatchQueue(label: "kz.diesel.NetworkingManager.dataTasksSyncQueue")
    private(set) var dataTasks: [String: DataTaskProtocol] = [:]
    
    public func add(_ task: DataTaskProtocol?) {
        guard let task = task else {
            return
        }
        
        dataTasksSyncQueue.sync {
            dataTasks[task.identifier] = task
        }
    }
    
    public func remove(_ identifier: String) {
        dataTasksSyncQueue.sync {
            dataTasks[identifier] = nil
        }
    }
    
    public func cancel(_ identifier: String) {
        dataTasksSyncQueue.sync {
            _ = dataTasks[identifier]?.cancelAndReturnSelf()
        }
        remove(identifier)
    }
    
    public func cancelAll() {
        dataTasks.forEach { _ = $0.value.cancelAndReturnSelf() }
        dataTasksSyncQueue.sync {
            dataTasks = [:]
        }
    }
}
