//
//  AlbumModel.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021.
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation
import SBServices

public struct AlbumModel {
    var id: String
    var name: String
    var url: String
}

extension AlbumModel {
    static func create(_ response: MemesResponse.DataObject.MemeObject) -> AlbumModel {
        AlbumModel(id: response.id,
                   name: response.name,
                   url: response.url)
    }
}
