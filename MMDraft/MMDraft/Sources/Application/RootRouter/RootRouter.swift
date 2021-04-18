//
//  RootRouter.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 18.04.2021.
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation

final class RootRouter: BaseCoordinatorRouter {
    private var window: UIWindow?
    
    override init(_ rootViewController: UIViewController = UIViewController()) {
        super.init(rootViewController)
        
        window = UIWindow()
        window?.rootViewController = rootViewController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}
