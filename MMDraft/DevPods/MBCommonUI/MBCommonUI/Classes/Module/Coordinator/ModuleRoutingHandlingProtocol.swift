//
//  ModuleRoutingHandlingProtocol.swift
//  MBCommonUI
//
//  Created by Zhenis Mutan on 23.11.2020.
//

import UIKit

public protocol ModuleRoutingHandlingProtocol: class {
    func performRouteForBackRouting()
    func performRouteForCloseRouting()
    func performModuleRemovedRouting()
    func performRouteForBackOrCloseRouting()
}
