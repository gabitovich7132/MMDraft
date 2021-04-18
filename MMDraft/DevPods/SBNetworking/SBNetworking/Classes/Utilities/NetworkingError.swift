//
//  NetworkingError.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import UIKit

public enum NetworkingError: Error {
    case noConnection
    case wrongURL
    case response(HTTPResponse)
    case dataTaskError(Error)
    case responseDecoding(Error)
    case unknown
}

extension NetworkingError: Equatable {
    public static func == (lhs: NetworkingError, rhs: NetworkingError) -> Bool {
        switch (lhs, rhs) {
        case (.noConnection, .noConnection):
            return true
        case (.wrongURL, .wrongURL):
            return true
        case let (.response( lr), .response(rr)):
            return lr == rr
        case let (.dataTaskError(lr), .dataTaskError(rr)):
            return lr.localizedDescription == rr.localizedDescription
        case let (.responseDecoding(lr), .responseDecoding(rr)):
            return lr.localizedDescription == rr.localizedDescription
        case (.unknown, .unknown):
            return true
        default:
            return false
        }
    }
}
