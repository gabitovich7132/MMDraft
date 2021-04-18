//
//  RequestProtocol.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import UIKit
import Alamofire

public protocol URLRequestable {
    var url: URL? { get }
}

public protocol RequestProtocol: URLRequestable {
    var schema: String { get }
    var host: String { get }
    var path: String { get }
    
    var urlParameters: [String: String] { get set }
    var headers: [String: String] { get set }
}

public protocol GetRequestProtocol: RequestProtocol {}

public protocol PostRequestProtocol: RequestProtocol {
    var bodyParameters: [String: Any] { get set }
}

public protocol PutRequestProtocol: RequestProtocol {
    var bodyParameters: [String: Any] { get set }
}

public protocol UploadRequestProtocol: RequestProtocol {
    var multipartFormData: ((MultipartFormData) -> Void)? { get set }
}

public protocol DeleteRequestProtocol: RequestProtocol {}

public protocol PatchRequestProtocol: RequestProtocol {
    var bodyParameters: [String: Any] { get set }
}

public extension RequestProtocol {
    var urlComponents: URLComponents {
        URLComponents.construct(schema, host, path, urlParameters)
    }
    
    var url: URL? {
        urlComponents.url
    }
}
