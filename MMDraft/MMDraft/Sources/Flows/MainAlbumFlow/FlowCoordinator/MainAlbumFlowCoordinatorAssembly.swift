//
//  MainAlbumFlowCoordinatorAssembly.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//	Copyright © 2021 MediaMonks. All rights reserved.
//

import UIKit

class MainAlbumFlowCoordinatorAssembly: BaseAssemblyProtocol {
    func build(_ coordinatorRoutingHandler: MainAlbumFlowRoutingExitHandler) -> CoordinatorProtocol {
        let router = BaseCoordinatorRouter()
        let coordinator = MainAlbumFlowCoordinator(router: router)
        coordinator.coordinationExitPoint = coordinatorRoutingHandler
        return coordinator
    }
}
