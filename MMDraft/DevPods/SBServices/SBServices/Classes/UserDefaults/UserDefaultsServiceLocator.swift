//
//  UserDefaultsServiceLocator.swift
//  SBServices
//
//  Created by Zhenis Mutan on 10/27/20.
//

import Foundation

public enum UserDefaultsKeys: String {
    case isFirstLaunched
    case isLoggedIn
    case key
    case fcmToken
}

public protocol UserDefaultsProtocol {
    func set<V: Codable>(_ value: V?, _ key: UserDefaultsKeys)
    func getValue<V: Codable>(forKey defaultName: UserDefaultsKeys) -> V?
    func removeValue(forKey defaultName: UserDefaultsKeys)
}

extension UserDefaults: UserDefaultsProtocol {
    public func set<V>(_ value: V?, _ key: UserDefaultsKeys) where V : Codable {
        guard let value = value else {
            removeObject(forKey: key.rawValue)
            return
        }
        let data = try? JSONEncoder().encode(value)
        setValue(data, forKey: key.rawValue)
    }
    
    public func getValue<V>(forKey defaultName: UserDefaultsKeys) -> V? where V : Codable {
        guard let valueData = data(forKey: defaultName.rawValue) else {
            return nil
        }

        let value = try? JSONDecoder().decode(V.self, from: valueData)
        return value
    }
    
    public func removeValue(forKey defaultName: UserDefaultsKeys) {
        removeObject(forKey: defaultName.rawValue)
    }
}

public protocol UserDefaultsServiceLocator {
    func userDefaults() -> UserDefaultsProtocol
}

public extension UserDefaultsServiceLocator {
    func userDefaults() -> UserDefaultsProtocol {
        UserDefaults.standard
    }
}
