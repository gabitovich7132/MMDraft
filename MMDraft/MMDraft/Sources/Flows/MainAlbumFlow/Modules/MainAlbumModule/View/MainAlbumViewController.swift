//
//  MainAlbumViewController.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import UIKit

class MainAlbumViewController: BaseViewController {
    var output: MainAlbumViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        output?.viewDidLoad()
    }
}

// MARK: - Configure
extension MainAlbumViewController: MainAlbumViewInput {
    private func setupSubviews() {
        
    }
}

// MARK: View Input
extension MainAlbumViewController {
    
}

// MARK: Button Action
extension MainAlbumViewController {
    
}
