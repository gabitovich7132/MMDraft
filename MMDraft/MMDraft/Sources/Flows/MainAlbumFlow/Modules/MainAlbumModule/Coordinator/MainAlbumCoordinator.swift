//
//  MainAlbumCoordinator.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//	Copyright © 2021 MediaMonks. All rights reserved.
//

protocol MainAlbumCoordinatorProtocol: CoordinatorProtocol {
    
}

class MainAlbumCoordinator: BaseCoordinator<MainAlbumCoordinatorExitRoutingProtocol>, MainAlbumCoordinatorProtocol {
    override func start(with option: DeepLinkOptionProtocol?) {
        let module = MainAlbumAssembly().build(nil, self)
        guard let toPresent = module.toPresent() else {
            return
        }
        let navController = UINavigationController(rootViewController: toPresent)
        router.showScreen(navController)
    }
}

extension MainAlbumCoordinator: MainAlbumRoutingHandlingProtocol {
    
}
