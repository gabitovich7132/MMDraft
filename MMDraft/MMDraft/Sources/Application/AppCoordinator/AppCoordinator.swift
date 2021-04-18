//
//  AppCoordinator.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 18.04.2021.
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation
import MBCommonUI
import SBServices

protocol AppCoordinatorExitPoint: ModuleRoutingHandlingProtocol { }

protocol AppCoordinatorProtocol: CoordinatorProtocol { }

final class AppCoordinator: BaseCoordinator<AppCoordinatorExitPoint>, AppCoordinatorProtocol {
    typealias ServiceLocator = RootRouterLocator & APIServicesLocatorProtocol
    final class ServiceLocatorImpl: ServiceLocator {}
    
    init(serviceLocator: ServiceLocator = ServiceLocatorImpl()) {
        let router = serviceLocator.rootRouter()
        super.init(router: router)
    }
    
    override func start(with option: DeepLinkOptionProtocol?) {
        startMainFlow()
    }
}

extension AppCoordinator {
    func performRouteForBackRouting(_ coordinator: CoordinatorProtocol) {}
    
    func performRouteForCloseRouting(_ coordinator: CoordinatorProtocol) {}
    
    func performModuleRemovedRouting(_ coordinator: CoordinatorProtocol) {}
    
    func performRouteForBackOrCloseRouting(_ coordinator: CoordinatorProtocol) {}
}

// MARK: - MainAlbumFlowRoutingExitHandler
extension AppCoordinator: MainAlbumFlowRoutingExitHandler {
    
}

private extension AppCoordinator {
    func startMainFlow() {
        let flowCoordinator = MainAlbumFlowCoordinatorAssembly().build(self)
        flowCoordinator.start()
        addChild(flowCoordinator)
        
        if let toPresent = flowCoordinator.toPresent() {
            router.showScreen(toPresent)
        }
    }
}
