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
    
    private var memeList = [AlbumModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        output?.viewDidLoad()
    }
}

// MARK: - Configure
extension MainAlbumViewController: MainAlbumViewInput {
    private func setupSubviews() {
        navigationItem.title = "Main"
    }
}

// MARK: View Input
extension MainAlbumViewController {
    func setMemeList(list: [AlbumModel]) {
        memeList = list
    }
}

// MARK: Button Action
extension MainAlbumViewController {
    
}
