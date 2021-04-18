//
//  App.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 18.04.2021.
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation
import SBServices

protocol AppProtocol {
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    func applicationDidFinishLaunching(_ application: UIApplication,
                                       _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    func applicationContinueUserActivity(_ application: UIApplication,
                                         _ userActivity: NSUserActivity,
                                         _ restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
}

final class App: NSObject, AppProtocol {
    typealias ServiceLocator = AppCoordinatorServiceLocator & RunConfiguratorLocator
    final class ServiceLocatorImpl: ServiceLocator { }
    
    private let appCoordinator: CoordinatorProtocol
    private let runConfigurator: RunConfiguratorProtocol.Type
    
    init(serviceLocator: ServiceLocator = ServiceLocatorImpl()) {
        appCoordinator = serviceLocator.appCoordinator()
        runConfigurator = serviceLocator.runConfigurator()
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppAppearance.setupAppearance()
        runConfigurator.configure()
        return true
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication, _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let notification = launchOptions?[.remoteNotification] as? [String: AnyObject]
        let deepLink = DeepLinkOption.build(with: notification)
        appCoordinator.start(with: deepLink)
        return true
    }
    
    func applicationContinueUserActivity(_ application: UIApplication, _ userActivity: NSUserActivity, _ restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        let deepLink = DeepLinkOption.build(with: userActivity)
        appCoordinator.start(with: deepLink)
        return true
    }
}
