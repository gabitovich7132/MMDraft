//
//  DeepLinkOption.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 18.04.2021.
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation
import SBServices

public enum NavigationOption: DeepLinkOptionProtocol {
    case closeRouting
    case routeFor
}

public enum DeepLinkOption: DeepLinkOptionProtocol {
    case main
    case detailAlbum(AlbumModel)
    
    public static func build(with userActivity: NSUserActivity) -> DeepLinkOption? {
        nil
    }
    
    public static func build(with dict: [String: AnyObject]?) -> DeepLinkOption? {
        guard let screen = dict?["screen"] as? String else {
            return nil
        }
        
        switch screen {
        default:
            return nil
        }
    }
    
    private func identificator() -> String {
        switch self {
        case .main:
            return "main_flow"
        case .detailAlbum:
            return "detailAlbum"
        }
    }
}
