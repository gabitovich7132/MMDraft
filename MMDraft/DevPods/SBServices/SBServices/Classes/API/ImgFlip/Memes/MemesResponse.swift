//
//  MemesResponse.swift
//  Alamofire
//
//  Created by Zhenis Mutan on 19.04.2021.
//

import Foundation
import SBNetworking
import MBCommon

public struct MemesResponse: Decodable {
    public let data: DataObject
    
    public struct DataObject: Decodable {
        public let memes: [MemeObject]
        
        public struct MemeObject: Decodable {
            public let id: String
            public let name: String
            public let url: String
        }
    }
    
    public let success: Bool
    public let errorMessage: String?
    public let errorCode: Int?
}

extension MemesResponse: ApiResponseProtocol {
    public static func responseObject(_ data: Data?, _ response: HTTPURLResponse) throws -> Self {
        guard let data = data else {
            throw DataError.noData
        }
        
        return try JSONDecoder().decode(self, from: data)
    }
}
