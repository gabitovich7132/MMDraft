//
//  MainAlbumFlowCoordinator.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//	Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation

class MainAlbumFlowCoordinator: BaseFlowCoordinator<MainAlbumFlowRoutingExitHandler> {
    override init(router: CoordinatorRouterProtocol) {
        super.init(router: router)
    }
    
    override func start(with option: DeepLinkOptionProtocol?) {
        super.start(with: option)
        startMainModule()
    }
}

// MARK: - MainAlbumCoordinatorExitRoutingProtocol
extension MainAlbumFlowCoordinator: MainAlbumCoordinatorExitRoutingProtocol {
    
}

private extension MainAlbumFlowCoordinator {
    func startMainModule() {
        let coordinator = MainAlbumCoordinatorAssembly().build(router: router, routingHandler: self)
        coordinator.start()
        addChild(coordinator)
    }
}
