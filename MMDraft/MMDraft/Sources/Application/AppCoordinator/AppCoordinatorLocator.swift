//
//  AppCoordinatorLocator.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 18.04.2021.
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation
import MBCommonUI

protocol AppCoordinatorServiceLocator {
    func appCoordinator() -> CoordinatorProtocol
}

extension AppCoordinatorServiceLocator {
    func appCoordinator() -> CoordinatorProtocol {
        AppCoordinator()
    }
}
