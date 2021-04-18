//
//  AppServiceLocator.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 18.04.2021.
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import Foundation

protocol AppServiceLocator {
    func app() -> AppProtocol
}

extension AppServiceLocator {
    func app() -> AppProtocol {
        App()
    }
}

final class AppServiceLocatorImpl: AppServiceLocator {}
