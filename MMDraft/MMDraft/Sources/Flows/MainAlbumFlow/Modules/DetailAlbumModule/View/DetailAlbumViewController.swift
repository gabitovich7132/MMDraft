//
//  DetailAlbumViewController.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import UIKit

class DetailAlbumViewController: BaseViewController {
    var output: DetailAlbumViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        output?.viewDidLoad()
    }
}

// MARK: - Configure
extension DetailAlbumViewController: DetailAlbumViewInput {
    private func setupSubviews() {
        
    }
}

// MARK: View Input
extension DetailAlbumViewController {
    
}

// MARK: Button Action
extension DetailAlbumViewController {
    
}
