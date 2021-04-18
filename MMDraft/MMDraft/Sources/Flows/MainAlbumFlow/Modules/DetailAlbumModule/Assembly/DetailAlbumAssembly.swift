//
//  DetailAlbumAssembly.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import UIKit

typealias DetailAlbum = Module<DetailAlbumModuleInput, DetailAlbumModuleOutput>

class DetailAlbumAssembly: BaseAssemblyProtocol {
    func build(_ moduleOutput: DetailAlbumModuleOutput?,
               _ routingHandler: DetailAlbumRoutingHandlingProtocol) -> DetailAlbum {
        // View
        let view = DetailAlbumViewController()
        
        // Interactor
        let interactor = DetailAlbumInteractor()
        
        // Router
        let router = DetailAlbumRouter(viewController: view)
        
        // Presenter
        let presenter = DetailAlbumPresenter(interactor: interactor, router: router, view: view, moduleOutput: moduleOutput)
        
        // Dependency Setup
        view.output = presenter
        interactor.output = presenter
        router.moduleRoutingHandler = routingHandler
        
        return Module(view: view, input: presenter, output: moduleOutput)
    }
}
