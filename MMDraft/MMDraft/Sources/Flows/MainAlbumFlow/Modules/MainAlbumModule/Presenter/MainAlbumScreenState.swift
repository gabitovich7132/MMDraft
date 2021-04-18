//
//  MainAlbumScreenState.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021.
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation

public enum MainAlbumScreenState {
    case loading
    case error(Error)
    case result([AlbumModel])
}
