//
//  DetailAlbumPresenter.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation

class DetailAlbumPresenter: BasePresenter
<DetailAlbumModuleOutput,
DetailAlbumInteractorInput,
DetailAlbumRouterInputProtocol,
DetailAlbumViewInput> {
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
}

// MARK: Private
extension DetailAlbumPresenter {
    
}

// MARK: Module Input
extension DetailAlbumPresenter: DetailAlbumModuleInput {
    func setOption(_ option: DeepLinkOption) {
        switch option {
        case .detailAlbum(let object):
            view?.setAlbum(object: object)
        default:
            break
        }
    }
}

// MARK: View Output
extension DetailAlbumPresenter: DetailAlbumViewOutput {
    
}

// MARK: Interactor Output
extension DetailAlbumPresenter: DetailAlbumInteractorOutput {
    
}
