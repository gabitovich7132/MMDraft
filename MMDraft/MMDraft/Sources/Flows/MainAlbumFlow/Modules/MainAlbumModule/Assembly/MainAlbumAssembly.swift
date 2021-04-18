//
//  MainAlbumAssembly.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import UIKit

typealias MainAlbum = Module<MainAlbumModuleInput, MainAlbumModuleOutput>

class MainAlbumAssembly: BaseAssemblyProtocol {
    func build(_ moduleOutput: MainAlbumModuleOutput?,
               _ routingHandler: MainAlbumRoutingHandlingProtocol) -> MainAlbum {
        // View
        let view = MainAlbumViewController()
        
        // Interactor
        let interactor = MainAlbumInteractor()
        
        // Router
        let router = MainAlbumRouter(viewController: view)
        
        // Presenter
        let presenter = MainAlbumPresenter(interactor: interactor, router: router, view: view, moduleOutput: moduleOutput)
        
        // Dependency Setup
        view.output = presenter
        interactor.output = presenter
        router.moduleRoutingHandler = routingHandler
        
        return Module(view: view, input: presenter, output: moduleOutput)
    }
}
