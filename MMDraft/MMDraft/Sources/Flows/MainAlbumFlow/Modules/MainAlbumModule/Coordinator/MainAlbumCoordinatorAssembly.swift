//
//  MainAlbumCoordinatorAssembly.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//	Copyright © 2021 MediaMonks. All rights reserved.
//

import UIKit

class MainAlbumCoordinatorAssembly: BaseAssemblyProtocol {
    func build(router: CoordinatorRouterProtocol = BaseCoordinatorRouter(),
               routingHandler: MainAlbumCoordinatorExitRoutingProtocol) -> CoordinatorProtocol {
        let coordinator = MainAlbumCoordinator(router: router)
        coordinator.coordinationExitPoint = routingHandler
        return coordinator
    }
}
