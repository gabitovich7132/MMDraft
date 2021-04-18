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
    func performRouteForDetail(_ coordinator: CoordinatorProtocol, _ object: AlbumModel) {
        startDetailModule(.detailAlbum(object))
    }
}

// MARK: - DetailAlbumCoordinatorExitRoutingProtocol
extension MainAlbumFlowCoordinator: DetailAlbumCoordinatorExitRoutingProtocol {
    
}

private extension MainAlbumFlowCoordinator {
    func startMainModule() {
        let coordinator = MainAlbumCoordinatorAssembly().build(router: router, routingHandler: self)
        coordinator.start()
        addChild(coordinator)
    }
    
    func startDetailModule(_ option: DeepLinkOption) {
        let coordinator = DetailAlbumCoordinatorAssembly().build(router: router, routingHandler: self)
        coordinator.start(with: option)
        addChild(coordinator)
    }
}
