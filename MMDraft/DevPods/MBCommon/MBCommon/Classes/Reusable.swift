//
//  Reusable.swift
//  MBCommon
//
//  Created by Zhenis Mutan on 21.01.2021.
//

import Foundation

public typealias Callback = () -> Void

public protocol Reusable {
    var identifier: String { get }
}

extension Reusable {
    public var identifier: String {
        String(describing: self)
    }
}
