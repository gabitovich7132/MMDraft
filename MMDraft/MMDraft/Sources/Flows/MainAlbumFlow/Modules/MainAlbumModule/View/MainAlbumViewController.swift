//
//  MainAlbumViewController.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import UIKit
import MBCommon

class MainAlbumViewController: BaseViewController, Reusable {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    var output: MainAlbumViewOutput?
    
    private var memeList = [AlbumModel]()
    
    // MARK: - Lifecycle
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
        configureCollectionView()
    }
}

// MARK: View Input
extension MainAlbumViewController {
    func setMemeList(list: [AlbumModel]) {
        memeList = list
        collectionView.reloadData()
    }
}

// MARK: Button Action
extension MainAlbumViewController {
    
}

// MARK: - UICollectionViewDelegate
extension MainAlbumViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: - UICollectionViewDataSource
extension MainAlbumViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        memeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? AlbumCell {
            cell.configure(memeList[indexPath.item])
            return cell
        }

        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainAlbumViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 52) / 3
        return CGSize(width: width, height: width)
    }
}

private extension MainAlbumViewController {
    func configureCollectionView() {
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: identifier)
    }
}
