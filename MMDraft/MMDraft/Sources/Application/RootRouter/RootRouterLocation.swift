//
//  RootRouterLocation.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 18.04.2021.
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation

protocol RootRouterLocator {
    func rootRouter() -> BaseCoordinatorRouter
}

extension RootRouterLocator {
    func rootRouter() -> BaseCoordinatorRouter {
        RootRouter()
    }
}
