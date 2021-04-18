//
//  BaseRequest.swift
//  SBServices
//
//  Created by Zhenis Mutan on 10/27/20.
//

import Foundation
import SBNetworking

class BaseRequest: RequestProtocol {
    let schema = SBSchema.https.rawValue
    let host = ServicesConstants.HOST
    
    var path: String = ""
    var urlParameters: [String: String]
    var headers: [String: String]
    
    private static var baseHeaders: [String: String] {
        return [
          "Content-Type": "application/json"
        ]
    }
    
    init(path: String, urlParameters: [String: String], headers: [String: String]) {
        self.headers = type(of: self).baseHeaders
        self.path = path
        for (key, value) in headers {
            self.headers[key] = value
        }
        
        self.urlParameters = urlParameters
    }
}
