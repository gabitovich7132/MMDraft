//
//  NetworkSessionServiceLocator.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import UIKit
import Alamofire

public protocol NetworkSessionServiceLocator {
    func networkSession() -> NetworkSessionProtocol
}

extension NetworkSessionServiceLocator {
    public func networkSession() -> NetworkSessionProtocol {
        Alamofire.Session.default
    }
}
