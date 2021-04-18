//
//  MainAlbumInteractor.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation
import MBCommon
import SBServices

class MainAlbumInteractor {
    typealias ServiceLocatorAlias = APIServicesLocatorProtocol
    final class ServiceLocator: ServiceLocatorAlias {}
    
    weak var output: MainAlbumInteractorOutput?
    
    private let imgFlipService: ImgFlipServiceProtocol
    
    init(serviceLocator: ServiceLocatorAlias = ServiceLocator()) {
        imgFlipService = serviceLocator.imgFlipService()
    }
}

// MARK: Private
extension MainAlbumInteractor: MainAlbumInteractorInput {
    func getMemes(progressBlock: BlockObject<MainAlbumScreenState, Void>) {
        progressBlock.execute(.loading)
        
        let errorHandler = ErrorBlock { error in
            progressBlock.execute(.error(error))
        }
        
        let successHandler = BlockObject<MemesResponse, Void> { response in
            let list = response.data.memes.compactMap { AlbumModel.create($0) }
            progressBlock.execute(.result(list))
        }
        
        imgFlipService.getMemes(successHandler: successHandler,
                                errorHandler: errorHandler)
    }
}
