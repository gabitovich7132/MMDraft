//
//  ResponseProtocol.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import Foundation

public protocol ResponseProtocol {
    static func responseObject(_ data: Data?,
                               _ response: HTTPURLResponse) throws -> Self
}

public protocol HTTPURLResponseHolder {
    var httpResponse: HTTPURLResponse { get }
}
