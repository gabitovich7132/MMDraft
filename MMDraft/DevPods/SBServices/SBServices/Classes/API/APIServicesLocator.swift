//
//  APIServicesLocator.swift
//  SBServices
//
//  Created by Zhenis Mutan on 10/27/20.
//

import SBNetworking

public protocol ApiResponseProtocol: ResponseProtocol {
    var errorMessage: String? { get }
    var errorCode: Int? { get }
}
 
public struct ResponseInnerError {
    public let errorMessage: String?
    public let errorCode: Int?
}

public extension ApiResponseProtocol {
    var innerError: ResponseInnerError? {
        guard errorMessage != nil || errorCode != nil else {
            return nil
        }
        return ResponseInnerError(errorMessage: errorMessage, errorCode: errorCode)
    }
}

public protocol APIServicesLocatorProtocol {
    func imgFlipService() -> ImgFlipServiceProtocol
}

public extension APIServicesLocatorProtocol {
    func imgFlipService() -> ImgFlipServiceProtocol {
        ImgFlipService()
    }
}
