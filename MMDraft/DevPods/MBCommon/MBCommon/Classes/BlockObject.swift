//
//  BlockObject.swift
//  MBCommon
//
//  Created by Zhenis Mutan on 10/27/20.
//

import UIKit

public class BlockObject<Value, ReturnValue> {
    private var block: ((_ arg: Value) -> ReturnValue)?
    public let identifier = UUID()
    
    public init(block: ((_ arg: Value) -> ReturnValue)?) {
        self.block = block
    }
    
    public func execute(_ arg: Value) -> ReturnValue? {
        return block?(arg)
    }
}

public typealias StringBlock = BlockObject<String?, Void>
public typealias EmptyBlock = BlockObject<Void, Void>
public typealias ErrorBlock = BlockObject<Error, Void>
public typealias ImageBlock = BlockObject<UIImage, Void>
