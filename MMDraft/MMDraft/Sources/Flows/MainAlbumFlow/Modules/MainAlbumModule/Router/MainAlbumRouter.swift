//
//  MainAlbumRouter.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation

class MainAlbumRouter: BaseModuleRouter<MainAlbumRoutingHandlingProtocol> {
}

extension MainAlbumRouter: MainAlbumRouterInputProtocol {
    func routeForDetail(_ object: AlbumModel) {
        moduleRoutingHandler?.performRouteForDetail(object)
    }
}
