//
//  AlbumCell.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021.
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation
import UIKit
import MBCommon
import Kingfisher

class AlbumCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setups()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(_ object: AlbumModel) {
        guard let url = URL(string: object.url) else {
            return
        }
        
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
    }
}

private extension AlbumCell {
    func setups() {
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
        loadFromNib()
    }
}
