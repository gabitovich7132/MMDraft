//
//  AppAppearance.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 18.04.2021.
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import UIKit

final class AppAppearance {
    static func setupAppearance() {
        UINavigationBar.appearance().barTintColor = .white
        //UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        
        //UINavigationBar.appearance().backIndicatorImage = R.image.backItem()
        //UINavigationBar.appearance().backIndicatorTransitionMaskImage = R.image.backItem()
        //UINavigationBar.appearance().tintColor = R.color.main.accentBlue()
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}
