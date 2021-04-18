//
//  URLComponents+Extensions.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import Foundation

public extension URLComponents {
    static func construct(_ schema: String,
                          _ host: String,
                          _ path: String,
                          _ queryItems: [String: String?] = [:]) -> URLComponents {
        var components = URLComponents()
        components.scheme = schema
        components.host = host.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        components.path = path.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        var queryItemsToAdd: [URLQueryItem] = []
        queryItems.forEach {
            if let value = $0.value?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                queryItemsToAdd.append(URLQueryItem(name: $0.key, value: value))
            }
        }
        components.queryItems = queryItemsToAdd
        components.percentEncodedQuery = components.percentEncodedQuery?
            .replacingOccurrences(of: "+", with: "%2B").replacingOccurrences(of: "/", with: "%2F")
        return components
    }
}
