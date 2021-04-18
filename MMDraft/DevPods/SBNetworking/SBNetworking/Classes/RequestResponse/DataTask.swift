//
//  DataTask.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import MBCommon
import Alamofire

public protocol DataTaskProtocol: CancelableProtocol, ResumableProtocol {
    var identifier: String { get }
}

final class DataTask: DataTaskProtocol {
    let identifier: String
    let task: URLSessionTaskProtocol
    private(set) var isCancelled: Bool = false
    private var cancelBlock: EmptyBlock?
    
    init(task: URLSessionTaskProtocol,
         identifier: String = UUID().uuidString,
         cancelBlock: EmptyBlock? = nil) {
        self.task = task
        self.identifier = identifier
        self.cancelBlock = cancelBlock
    }
    
    func cancelAndReturnSelf() -> Self {
        guard !isCancelled, cancelBlock != nil else {
            return self
        }
        
        isCancelled = true
        _ = task.cancelAndReturnSelf()
        cancelBlock?.execute(())
        cancelBlock = nil
        
        return self
    }
    
    func resumeAndReturnSelf() -> Self {
        _ = task.resumeAndReturnSelf()
        return self
    }
}
