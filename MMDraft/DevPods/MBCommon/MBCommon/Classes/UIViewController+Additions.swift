//
//  UIViewController+Additions.swift
//  MBCommon
//
//  Created by Zhenis Mutan on 10/27/20.
//

import UIKit

extension UIViewController {
    public func addChildController(_ viewController: UIViewController, _ constraintsBlock: (_ view: UIView) -> Void) {
        addChildController(viewController, view, constraintsBlock)
    }
    
    public func addChildController(_ viewController: UIViewController, _ toView: UIView, _ constraintsBlock: (_ view: UIView) -> Void) {
        viewController.willMove(toParent: self)
        addChild(viewController)
        toView.addSubview(viewController.view)
        constraintsBlock(viewController.view)
        viewController.didMove(toParent: self)
    }
    
    public func lastChild() -> UIViewController {
        guard let lastChildController = children.last else {
            return self
        }
        return lastChildController.lastChild()
    }

    public func firstNavigationItem() -> UINavigationItem {
        if parent is UINavigationController {
            return self.navigationItem
        }
        return parent?.firstNavigationItem() ?? self.navigationItem
    }
    
    /// A Boolean value that determines whether the view controller is first in its navigation stack
    public var isRootViewController: Bool {
        self === navigationController?.viewControllers.first
    }
}
