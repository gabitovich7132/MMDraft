//
//  CoordinatorRouterProtocol.swift
//  MBCommonUI
//
//  Created by Zhenis Mutan on 23.11.2020.
//

import MBCommon
import UIKit

public enum NavigationPushPopStyle: UInt {
    case fade
    case standart
}

public protocol CoordinatorRouterProtocol: class, AlertRoutableProtocol {
    var rootViewController: UIViewController { get }
    var didPresent: Bool { get set }
    
    func showScreen(_ module: PresentableProtocol)
    
    func present(_ module: PresentableProtocol)
    func present(_ module: PresentableProtocol, style: UIModalPresentationStyle)
    func present(_ module: PresentableProtocol, animated: Bool, style: UIModalPresentationStyle)
    
    func push(_ module: PresentableProtocol)
    func push(_ module: PresentableProtocol, _ style: NavigationPushPopStyle)
    func push(_ module: PresentableProtocol, _ style: NavigationPushPopStyle, hideBottomBar: Bool)
    func push(_ module: PresentableProtocol, _ style: NavigationPushPopStyle, animated: Bool)
    func push(_ module: PresentableProtocol, _ style: NavigationPushPopStyle, animated: Bool, completion: EmptyBlock?)
    func push(_ module: PresentableProtocol, _ style: NavigationPushPopStyle, animated: Bool, hideBottomBar: Bool, completion: EmptyBlock?)
    
    func popModule()
    func popModule(animated: Bool)
    func popModule(style: NavigationPushPopStyle, animated: Bool)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: EmptyBlock?)
    
    func popToFirstControllerInStack(animated: Bool)
    func popToFirstControllerInStack(style: NavigationPushPopStyle, animated: Bool)
    func popToRootViewController(animated: Bool)

    func leaveOnlyTopControllerInStack()
    func setControllerInStack(_ module: PresentableProtocol, animated: Bool)
}

public extension CoordinatorRouterProtocol {
    func present(_ module: PresentableProtocol)  {
        present(module, style: .overFullScreen)
    }
    
    func present(_ module: PresentableProtocol, style: UIModalPresentationStyle) {
        present(module, animated: true, style: style)
    }
    
    func present(_ module: PresentableProtocol, animated: Bool, style: UIModalPresentationStyle) {
        guard let controller = module.toPresent() else {
            return
        }
        controller.modalPresentationStyle = style
        
        var presentingViewController: UIViewController = rootViewController
        while let nextPresentedController = presentingViewController.presentedViewController {
            presentingViewController = nextPresentedController
        }
        
        presentingViewController.present(controller, animated: animated, completion: nil)
        rootViewController.setNeedsStatusBarAppearanceUpdate()
        didPresent = true
    }
    
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: EmptyBlock?) {
        rootViewController.dismiss(animated: animated, completion: { completion?.execute(()) })
    }
    
    func push(_ module: PresentableProtocol)  {
        push(module, .standart, animated: true)
    }
    
    func push(_ module: PresentableProtocol, _ style: NavigationPushPopStyle)  {
        push(module, style, animated: true)
    }
    
    func push(_ module: PresentableProtocol, _ style: NavigationPushPopStyle, hideBottomBar: Bool)  {
        push(module, style, animated: true, hideBottomBar: hideBottomBar, completion: nil)
    }
    
    func push(_ module: PresentableProtocol, _ style: NavigationPushPopStyle, animated: Bool)  {
        push(module, style, animated: animated, completion: nil)
    }
    
    func push(_ module: PresentableProtocol, _ style: NavigationPushPopStyle, animated: Bool, completion: EmptyBlock?) {
        push(module, style, animated: animated, hideBottomBar: false, completion: completion)
    }
    
    func popModule() {
        popModule(animated: true)
    }
    
    func popModule(animated: Bool) {
        popModule(style: .standart, animated: animated)
    }
    
    func popToFirstControllerInStack(animated: Bool) {
        popToFirstControllerInStack(style: .standart, animated: animated)
    }
        
    // MARK: PresentableProtocol
    func toPresent() -> UIViewController? {
        return rootViewController
    }
}

