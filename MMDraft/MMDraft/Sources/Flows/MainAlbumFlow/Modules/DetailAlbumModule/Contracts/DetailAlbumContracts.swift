//
//  DetailAlbumContracts.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation

// Module Input
protocol DetailAlbumModuleInput {
    func setOption(_ option: DeepLinkOption)
}

// Module Output
protocol DetailAlbumModuleOutput {
    
}

// View Input
protocol DetailAlbumViewInput: class {
    func setAlbum(object: AlbumModel)
}

// View Output
protocol DetailAlbumViewOutput: ViewOutputProtocol {
    func viewDidLoad()
}

// Interactor Input
protocol DetailAlbumInteractorInput {
    
}

// Interactor Output
protocol DetailAlbumInteractorOutput: class {
    
}

// Router
protocol DetailAlbumRouterInputProtocol: AlertRoutableProtocol, BaseModuleRoutableProtocol {
    
}

// Routing Handling
protocol DetailAlbumRoutingHandlingProtocol: ModuleRoutingHandlingProtocol {
    
}

// Coordinator Routing Handling
protocol DetailAlbumCoordinatorExitRoutingProtocol: FlowExitPointProtocol {
    
}
