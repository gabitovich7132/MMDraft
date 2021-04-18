//
//  NetworkingManagerServiceLocator.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import UIKit

public protocol NetworkingManagerServiceLocator {
    func networkingManager(syncQueue: DispatchQueue, shared: Bool) -> NetworkingManagerProtocol
}

extension NetworkingManagerServiceLocator {
    public func networkingManager(syncQueue: DispatchQueue, shared: Bool) -> NetworkingManagerProtocol {
        shared ? NetworkingManager.shared : NetworkingManager(syncQueue: syncQueue)
    }
    
    public func networkingManager() -> NetworkingManagerProtocol {
        networkingManager(syncQueue: .main, shared: true)
    }
}
