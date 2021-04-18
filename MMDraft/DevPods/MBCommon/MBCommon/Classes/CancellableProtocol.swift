//
//  CancellableProtocol.swift
//  MBCommon
//
//  Created by Zhenis Mutan on 10/27/20.
//

import UIKit

public protocol CancelableProtocol {
    var isCancelled: Bool { get }
    
    func cancelAndReturnSelf() -> Self
}

extension DispatchWorkItem: CancelableProtocol {
    public func cancelAndReturnSelf() -> Self {
        cancel()
        return self
    }
}
