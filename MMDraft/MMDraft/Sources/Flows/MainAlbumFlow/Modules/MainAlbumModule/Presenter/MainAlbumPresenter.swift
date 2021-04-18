//
//  MainAlbumPresenter.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation
import MBCommon

class MainAlbumPresenter: BasePresenter
<MainAlbumModuleOutput,
MainAlbumInteractorInput,
MainAlbumRouterInputProtocol,
MainAlbumViewInput> {
    override func viewDidLoad() {
        super.viewDidLoad()
        getMemes()
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
    func didSelectAlbum(object: AlbumModel) {
        router?.routeForDetail(object)
    }
}

// MARK: Interactor Output
extension MainAlbumPresenter: MainAlbumInteractorOutput {
    
}

private extension MainAlbumPresenter {
    func getMemes() {
        let progressBlock = BlockObject<MainAlbumScreenState, Void> { [weak self] state in
            guard let self = self else {
                return
            }
            
            switch state {
            case .loading:
                break
            case .error(let error):
                break
            case .result(let list):
                self.view?.setMemeList(list: list)
            }
        }
        
        interactor?.getMemes(progressBlock: progressBlock)
    }
}
