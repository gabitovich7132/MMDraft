//
//  HTTPResponse.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import UIKit

public enum HTTPResponse: Equatable, CustomStringConvertible {
    public static func == (lhs: HTTPResponse, rhs: HTTPResponse) -> Bool {
        switch (lhs, rhs) {
        case let (.informational( _, code1), .informational(_, code2)):
            return code1 == code2
        case (.success, .success):
            return true
        case let (.redirection( _, code1), .redirection(_, code2)):
            return code1 == code2
        case let (.client( _, code1), .client(_, code2)):
            return code1 == code2
        case let (.server( _, code1), .server(_, code2)):
            return code1 == code2
        default:
            return false
        }
    }
    
    case informational(Error?, Int)
    case success(Int)
    case redirection(Error?, Int)
    case client(Error?, Int)
    case server(Error?, Int)
    
    init?(value: Int, internalError: Error?) {
        switch value {
        case 100...199:
            self = .informational(internalError, value)
        case 200...299:
            self = .success(value)
        case 300...399:
            self = .redirection(internalError, value)
        case 400...499:
            self = .client(internalError, value)
        case 500...599:
            self = .server(internalError, value)
        default:
            return nil
        }
    }
    
    public var description: String {
        switch self {
        case let .success(code):
            return "success \(code)"
        case let .informational(error, code):
            guard let error = error else {
                return "internal \(code)"
            }
            return "internal \(code): \(error.localizedDescription)"
        case let .redirection(error, code):
            guard let error = error else {
                return "redirection \(code)"
            }
            return "redirection \(code): \(error.localizedDescription)"
        case let .client(error, code):
            guard let error = error else {
                return "client \(code)"
            }
            return "client \(code): \(error.localizedDescription)"
        case let .server(error, code):
            guard let error = error else {
                return "server \(code)"
            }
            return "server \(code): \(error.localizedDescription)"
        }
    }
    
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        default:
            return false
        }
    }
}
