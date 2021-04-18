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
    
}

// View Output
protocol MainAlbumViewOutput: ViewOutputProtocol {
    func viewDidLoad()
}

// Interactor Input
protocol MainAlbumInteractorInput {
    
}

// Interactor Output
protocol MainAlbumInteractorOutput: class {
    
}

// Router
protocol MainAlbumRouterInputProtocol: AlertRoutableProtocol, BaseModuleRoutableProtocol {
    
}

// Routing Handling
protocol MainAlbumRoutingHandlingProtocol: ModuleRoutingHandlingProtocol {
    
}

// Coordinator Routing Handling
protocol MainAlbumCoordinatorExitRoutingProtocol: FlowExitPointProtocol {
    
}
