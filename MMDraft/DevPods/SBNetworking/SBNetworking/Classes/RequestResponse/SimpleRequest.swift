//
//  SimpleRequest.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import Foundation

public struct SimpleRequest: URLRequestable {
    public var url: URL?
    
    public init(url: URL?) {
        self.url = url
    }
}
