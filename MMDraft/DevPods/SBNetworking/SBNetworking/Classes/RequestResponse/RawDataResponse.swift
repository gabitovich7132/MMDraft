//
//  RawDataResponse.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import Foundation

public enum DataError: Error {
    case noData
}

public struct DataResponse: ResponseProtocol {
    public var httpResponse: HTTPURLResponse
    public let data: Data
    
    public static func responseObject(_ data: Data?, _ response: HTTPURLResponse) throws -> DataResponse {
        guard let data = data else {
            throw DataError.noData
        }
        
        return DataResponse(httpResponse: response, data: data)
    }
    
    public static func responseList(_ data: Data?, _ response: HTTPURLResponse) throws -> [DataResponse] {
        guard let data = data else {
            throw DataError.noData
        }
        
        return [DataResponse(httpResponse: response, data: data)]
    }
}
