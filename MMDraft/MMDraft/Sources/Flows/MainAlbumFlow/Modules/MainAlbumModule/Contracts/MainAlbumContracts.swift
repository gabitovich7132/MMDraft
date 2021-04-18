//
//  MainAlbumContracts.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation

// Module Input
protocol MainAlbumModuleInput {
    
}

// Module Output
protocol MainAlbumModuleOutput {
    
}

// View Input
protocol MainAlbumViewInput: class {
    func setMemeList(list: [AlbumModel])
}

// View Output
protocol MainAlbumViewOutput: ViewOutputProtocol {
    func viewDidLoad()
    func didSelectAlbum(object: AlbumModel)
}

// Interactor Input
protocol MainAlbumInteractorInput {
    func getMemes(progressBlock: BlockObject<MainAlbumScreenState, Void>)
}

// Interactor Output
protocol MainAlbumInteractorOutput: class {
    
}

// Router
protocol MainAlbumRouterInputProtocol: AlertRoutableProtocol, BaseModuleRoutableProtocol {
    func routeForDetail(_ object: AlbumModel)
}

// Routing Handling
protocol MainAlbumRoutingHandlingProtocol: ModuleRoutingHandlingProtocol {
    func performRouteForDetail(_ object: AlbumModel)
}

// Coordinator Routing Handling
protocol MainAlbumCoordinatorExitRoutingProtocol: FlowExitPointProtocol {
    func performRouteForDetail(_ coordinator: CoordinatorProtocol, _ object: AlbumModel)
}
