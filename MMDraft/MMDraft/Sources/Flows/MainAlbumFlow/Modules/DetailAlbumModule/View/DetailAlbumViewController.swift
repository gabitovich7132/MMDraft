//
//  DetailAlbumViewController.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 19.04.2021
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import UIKit
import Kingfisher
import Rswift

class DetailAlbumViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Variables
    var output: DetailAlbumViewOutput?
    private var gestureRecognizer = UITapGestureRecognizer()
    private var imageObject: AlbumModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        output?.viewDidLoad()
    }
}

// MARK: - Configure
extension DetailAlbumViewController: DetailAlbumViewInput {
    private func setupSubviews() {
        configureNavigation()
        configureScrollView()
        setupGestureRecognizer()
        loadImage()
    }
}

// MARK: View Input
extension DetailAlbumViewController {
    func setAlbum(object: AlbumModel) {
        imageObject = object
    }
}

// MARK: Button Action
extension DetailAlbumViewController {
    @objc func handleDoubleTap() {
        if scrollView.zoomScale == 1 {
            let rect = zoomRectForScale(scrollView.maximumZoomScale, center: gestureRecognizer.location(in: gestureRecognizer.view))
            scrollView.zoom(to: rect, animated: true)
        } else {
            scrollView.setZoomScale(1, animated: true)
        }
    }
    
    @objc func handleDismiss(_ sender: UIBarButtonItem) {
        output?.didClose()
    }
}

// MARK: UIScrollViewDelegate
extension DetailAlbumViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}

private extension DetailAlbumViewController {
    func loadImage() {
        guard let urlString = imageObject?.url,
              let url = URL(string: urlString) else {
            return
        }
        
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
    }
    
    func configureScrollView() {
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 2.0
    }
    
    func setupGestureRecognizer() {
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        gestureRecognizer.numberOfTapsRequired = 2
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    func configureNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: R.image.close(), style: .done, target: self, action: #selector(handleDismiss(_:)))
    }
    
    func zoomRectForScale(_ scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        zoomRect.size.height = imageView.frame.size.height / scale
        zoomRect.size.width = imageView.frame.size.width / scale
        let newCenter = scrollView.convert(center, from: imageView)
        zoomRect.origin.x = newCenter.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = newCenter.y - (zoomRect.size.height / 2.0)
        return zoomRect
    }
}
