//
//  URLSessionTaskProtocol.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import MBCommon

protocol URLSessionTaskProtocol: CancelableProtocol, ResumableProtocol { }

extension URLSessionDataTask: URLSessionTaskProtocol {
    public func resumeAndReturnSelf() -> Self {
        resume()
        return self
    }
    
    public func cancelAndReturnSelf() -> Self {
        cancel()
        return self
    }
    
    public var isCancelled: Bool {
        state == .canceling
    }
}
