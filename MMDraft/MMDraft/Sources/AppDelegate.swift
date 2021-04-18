//
//  AppDelegate.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 18.04.2021.
//

@_exported import MBCommon
@_exported import MBCommonUI
@_exported import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private lazy var app = AppServiceLocatorImpl().app()

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        app.application(application, willFinishLaunchingWithOptions: launchOptions)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        app.applicationDidFinishLaunching(application, launchOptions)
    }
    
    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        app.applicationContinueUserActivity(application, userActivity, restorationHandler)
    }
}
