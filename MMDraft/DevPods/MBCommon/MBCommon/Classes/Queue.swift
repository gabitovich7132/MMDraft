//
//  Queue.swift
//  MBCommon
//
//  Created by Zhenis Mutan on 10/27/20.
//

import Foundation

public struct Queue<T: Equatable> {
    private var array: [T] = []
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public init() {}
    
    public func contains(_ element: T) -> Bool {
        array.contains(element)
    }

    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else {
            return nil
        }
        let first = array.first
        array.removeFirst()
        return first
    }
    
    public func peek() -> T? {
      array.first
    }
    
    public mutating func clear() {
        array.removeAll()
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        array.description
    }
}
