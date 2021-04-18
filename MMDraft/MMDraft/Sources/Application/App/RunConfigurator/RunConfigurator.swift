//
//  RunConfigurator.swift
//  MMDraft
//
//  Created by Zhenis Mutan on 18.04.2021.
//  Copyright © 2021 MediaMonks. All rights reserved.
//

import SBNetworking
import SBServices

protocol RunConfiguratorProtocol {
    static func configure()
}

class RunConfigurator: RunConfiguratorProtocol {
    static func configure() {
        SBDebugConfig.allowedSchema = ServicesConstants.HOST
    }
}

protocol RunConfiguratorLocator {
    func runConfigurator() -> RunConfiguratorProtocol.Type
}

extension RunConfiguratorLocator {
    func runConfigurator() -> RunConfiguratorProtocol.Type {
        RunConfigurator.self
    }
}
