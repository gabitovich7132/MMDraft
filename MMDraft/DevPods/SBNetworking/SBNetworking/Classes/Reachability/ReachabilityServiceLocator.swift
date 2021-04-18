//
//  ReachabilityServiceLocator.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

public protocol ReachabilityServiceLocator {
    func reachabilityService() -> ReachabilityProtocol.Type
}

extension ReachabilityServiceLocator {
    public func reachabilityService() -> ReachabilityProtocol.Type {
        Reachability.self
    }
}
