//
//  DetailAlbumCoordinatorAssembly.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//	Copyright © 2021 MediaMonks. All rights reserved.
//

import UIKit

class DetailAlbumCoordinatorAssembly: BaseAssemblyProtocol {
    func build(router: CoordinatorRouterProtocol = BaseCoordinatorRouter(),
               routingHandler: DetailAlbumCoordinatorExitRoutingProtocol) -> CoordinatorProtocol {
        let coordinator = DetailAlbumCoordinator(router: router)
        coordinator.coordinationExitPoint = routingHandler
        return coordinator
    }
}
