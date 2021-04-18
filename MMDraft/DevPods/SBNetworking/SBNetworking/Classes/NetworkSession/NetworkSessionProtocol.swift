//
//  NetworkSessionProtocol.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import UIKit
import MBCommon

public protocol NetworkSessionProtocol {
    func networkingDataTask(with request: RequestProtocol,
                            identifier: String,
                            completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void,
                            cancelBlock: EmptyBlock) -> DataTaskProtocol?
}

extension URLSession: NetworkSessionProtocol {
    public func networkingDataTask(with request: RequestProtocol,
                                   identifier: String,
                                   completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void,
                                   cancelBlock: EmptyBlock) -> DataTaskProtocol? {
        guard let url = request.url else {
            return nil
        }
        
        let task = dataTask(with: url, completionHandler: completionHandler)
        let dataTask = DataTask(task: task, identifier: identifier, cancelBlock: cancelBlock)
        
        return dataTask
    }
}
