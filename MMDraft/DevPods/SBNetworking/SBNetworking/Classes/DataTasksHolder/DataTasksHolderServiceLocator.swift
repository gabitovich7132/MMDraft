//
//  DataTasksHolderServiceLocator.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import UIKit

public protocol DataTasksHolderServiceLocator {
    func dataTasksHolder() -> DataTasksHolderProtocol
}

extension DataTasksHolderServiceLocator {
    public func dataTasksHolder() -> DataTasksHolderProtocol {
        DataTasksHolder()
    }
}
