//
//  BaseViewController.swift
//  MBCommonUI
//
//  Created by Zhenis Mutan on 23.11.2020.
//

import UIKit
import SnapKit

public enum ViewDataState {
    case loading
    case loaded
    case error(Error)
}

public protocol BaseViewInput: class {
    func updateState(_ state: ViewDataState)
    func updateSkeletonState(_ state: ViewDataState)
}

open class BaseViewController: UIViewController, ViewControllerProtocol {
    open var isShowNavigationBar = true
    open var isHidesBarsOnSwipe = false
    
    public init() {
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setBackBarItem()
        validateStatusBar()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public func validateStatusBar() {

    }
    
    public func setBackBarItem() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                                style: .done,
                                                                target: self,
                                                                action: nil)
    }
    
    public func updateState(_ state: ViewDataState) {
        switch state {
        case .loading:
            //loadingIndicator.startAnimation(in: view)
            break
        case .loaded:
            //loadingIndicator.stopAnimation()
            break
        case .error(let error):
            //loadingIndicator.stopAnimation()
            showAlert(error: error)
        }
    }
    
    public func updateSkeletonState(_ state: ViewDataState) {
        switch state {
        case .loading:
            //view.showAnimatedGradientSkeleton()
            break
        case .loaded:
            //view.stopSkeletonAnimation()
            break
        case .error(let error):
            //view.stopSkeletonAnimation()
            showAlert(error: error)
        }
    }
}

private extension BaseViewController {
    func showAlert(error: Error) {
        let controller = UIAlertController(title: "Ошибка", message: error.localizedDescription, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        controller.addAction(cancel)
        controller.view.tintColor = UIColor(hexString: "#06CBD7")
        present(controller, animated: true, completion: nil)
    }
}
