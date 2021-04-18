//
//  DetailAlbumCoordinator.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//	Copyright © 2021 MediaMonks. All rights reserved.
//

protocol DetailAlbumCoordinatorProtocol: CoordinatorProtocol {
    
}

class DetailAlbumCoordinator: BaseCoordinator<DetailAlbumCoordinatorExitRoutingProtocol>, DetailAlbumCoordinatorProtocol {
    override func start(with option: DeepLinkOptionProtocol?) {
        guard let option = option as? DeepLinkOption else {
            return
        }
        
        let module = DetailAlbumAssembly().build(nil, self)
        module.input.setOption(option)
        
        guard let toPresent = module.toPresent() else {
            return
        }
        let navController = UINavigationController(rootViewController: toPresent)
        router.present(navController, animated: true, style: .popover)
    }
}

extension DetailAlbumCoordinator: DetailAlbumRoutingHandlingProtocol {
    
}
