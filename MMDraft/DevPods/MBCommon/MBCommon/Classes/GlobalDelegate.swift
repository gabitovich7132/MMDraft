//
//  GlobalDelegate.swift
//  MBCommon
//
//  Created by Zhenis Mutan on 13.01.2021.
//

import Foundation

public protocol GlobalDelegate: class {
    func didSelect()
    func didSelect(at index: Int)
}
