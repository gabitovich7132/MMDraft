//
//  URLTaskProcessorServiceLocator.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import UIKit

public protocol URLTaskProcessorServiceLocator {
    func taskProcessor(session: NetworkSessionProtocol) -> URLTaskProcessorProtocol
}

extension URLTaskProcessorServiceLocator {
    public func taskProcessor(session: NetworkSessionProtocol) -> URLTaskProcessorProtocol {
        URLTaskProcessor()
    }
}
