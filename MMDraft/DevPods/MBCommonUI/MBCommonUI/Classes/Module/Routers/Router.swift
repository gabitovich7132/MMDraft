//
//  Router.swift
//  MBCommonUI
//
//  Created by Zhenis Mutan on 23.11.2020.
//

import MBCommon
import UIKit

public protocol BaseModuleRoutableProtocol {
    var viewController: ViewControllerProtocol? { get }
    
    func goBackRouting()
    func closeRouting()
    func goBackOrCloseRouting()
    func removeRouting()
}

open class Router<ROUTINGHANDLER>: BaseModuleRoutableProtocol {
    private var moduleRoutingHandlerWeakContainer: WeakContainer<ROUTINGHANDLER>?
    public var moduleRoutingHandler: ROUTINGHANDLER? {
        get {
            moduleRoutingHandlerWeakContainer?.value
        } set {
            if let value = newValue {
                moduleRoutingHandlerWeakContainer = WeakContainer(value: value)
            } else {
                moduleRoutingHandlerWeakContainer = nil
            }
        }
    }
    
    public weak var viewController: ViewControllerProtocol?
    
    deinit {
        (moduleRoutingHandler as? ModuleRoutingHandlingProtocol)?.performModuleRemovedRouting()
    }
    
    public init(viewController: ViewControllerProtocol?) {
        self.viewController = viewController
    }
    
    public func present(_ module: PresentableProtocol, animated: Bool, style: UIModalPresentationStyle) {
        guard let controller = module.toPresent() else {
            return
        }
        controller.modalPresentationStyle = style
        
        var presentingViewController: UIViewController? = viewController
        while let nextPresentedController = presentingViewController?.presentedViewController {
            presentingViewController = nextPresentedController
        }
        
        presentingViewController?.present(controller, animated: animated, completion: nil)
        viewController?.setNeedsStatusBarAppearanceUpdate()
    }
}

public extension Router {
    func goBackRouting() {
        (moduleRoutingHandler as? ModuleRoutingHandlingProtocol)?.performRouteForBackRouting()
    }
    
    func closeRouting() {
        (moduleRoutingHandler as? ModuleRoutingHandlingProtocol)?.performRouteForCloseRouting()
    }
    
    func goBackOrCloseRouting() {
        (moduleRoutingHandler as? ModuleRoutingHandlingProtocol)?.performRouteForBackOrCloseRouting()
    }
    
    func removeRouting() {
        (moduleRoutingHandler as? ModuleRoutingHandlingProtocol)?.performModuleRemovedRouting()
    }
}

extension Router: PresentableProtocol {
    public func toPresent() -> UIViewController? {
        return viewController
    }
}

