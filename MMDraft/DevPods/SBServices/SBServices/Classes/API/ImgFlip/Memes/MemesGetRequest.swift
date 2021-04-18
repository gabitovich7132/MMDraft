//
//  MemesGetRequest.swift
//  SBServices
//
//  Created by Zhenis Mutan on 19.04.2021.
//

import SBNetworking

class MemesGetRequest: BaseRequest, GetRequestProtocol {
    var bodyParameters: [String : Any] = [:]
    
    init() {
        super.init(path: "/get_memes", urlParameters: [:], headers: [:])
    }
}
