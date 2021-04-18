//
//  MainAlbumPresenter.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation

class MainAlbumPresenter: BasePresenter
<MainAlbumModuleOutput,
MainAlbumInteractorInput,
MainAlbumRouterInputProtocol,
MainAlbumViewInput> {
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
}

// MARK: Private
extension MainAlbumPresenter {
    
}

// MARK: Module Input
extension MainAlbumPresenter: MainAlbumModuleInput {
    
}

// MARK: View Output
extension MainAlbumPresenter: MainAlbumViewOutput {
    
}

// MARK: Interactor Output
extension MainAlbumPresenter: MainAlbumInteractorOutput {
    
}
