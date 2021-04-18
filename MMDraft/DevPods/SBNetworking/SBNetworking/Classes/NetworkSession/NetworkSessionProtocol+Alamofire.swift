//
//  NetworkSessionProtocol+Alamofire.swift
//  SBNetworking
//
//  Created by Zhenis Mutan on 10/27/20.
//

import Alamofire
import MBCommon
import UIKit

extension Alamofire.Session: NetworkSessionProtocol {
    private func session() -> Alamofire.Session {
        AlamofireSessionLocator.session()
    }
    
    public func networkingDataTask(with request: RequestProtocol,
                                   identifier: String,
                                   completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void,
                                   cancelBlock: EmptyBlock) -> DataTaskProtocol? {
        if let getRequest = request as? GetRequestProtocol {
            return makeGetRequestTask(with: getRequest,
                                      identifier: identifier,
                                      completionHandler: completionHandler,
                                      cancelBlock: cancelBlock)
        } else if let postRequest = request as? PostRequestProtocol {
            return makePostRequestTask(with: postRequest,
                                       identifier: identifier,
                                       completionHandler: completionHandler,
                                       cancelBlock: cancelBlock)
        } else if let putRequest = request as? PutRequestProtocol {
            return makePutRequestTask(with: putRequest,
                                      identifier: identifier,
                                      completionHandler: completionHandler,
                                      cancelBlock: cancelBlock)
        } else if let uploadRequest = request as? UploadRequestProtocol {
            return makeUploadRequestTask(with: uploadRequest,
                                         identifier: identifier,
                                         completionHandler: completionHandler,
                                         cancelBlock: cancelBlock)
        } else if let patchRequest = request as? PatchRequestProtocol {
            return makePatchRequestTask(with: patchRequest,
                                        identifier: identifier,
                                        completionHandler: completionHandler,
                                        cancelBlock: cancelBlock)
        } else if let deleteRequest = request as? DeleteRequestProtocol {
            return makeDeleteRequestTask(with: deleteRequest,
                                         identifier: identifier,
                                         completionHandler: completionHandler,
                                         cancelBlock: cancelBlock)
        }

        return nil
    }
    
    private func makePostRequestTask(with request: PostRequestProtocol,
                                     identifier: String,
                                     completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void,
                                     cancelBlock: EmptyBlock) -> DataTaskProtocol? {
        guard let url = request.url else {
            return nil
        }

        let request = session()
            .request(url, method: .post, parameters: request.bodyParameters, encoding: JSONEncoding.default, headers: HTTPHeaders(request.headers))
            .responseJSON { response in
                completionHandler(response.data, response.response, response.error)
                print(response.debugDescription)
            }
        
        return DataTask(task: request, identifier: identifier, cancelBlock: cancelBlock)
    }
    
    private func makePutRequestTask(with request: PutRequestProtocol,
                                    identifier: String,
                                    completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void,
                                    cancelBlock: EmptyBlock) -> DataTaskProtocol? {
        guard let url = request.url else {
            return nil
        }
        
        let request = session()
            .request(url, method: .put, parameters: request.bodyParameters, encoding: JSONEncoding.default, headers: HTTPHeaders(request.headers))
            .responseJSON { response in
                completionHandler(response.data, response.response, response.error)
                print(response.debugDescription)
            }

        return DataTask(task: request, identifier: identifier, cancelBlock: cancelBlock)
    }
    
    private func makeDeleteRequestTask(with request: DeleteRequestProtocol,
                                       identifier: String,
                                       completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void,
                                       cancelBlock: EmptyBlock) -> DataTaskProtocol? {
        guard let url = request.url else {
            return nil
        }
        
        let request = session()
            .request(url, method: .delete, encoding: JSONEncoding.default, headers: HTTPHeaders(request.headers))
            .responseJSON { response in
                completionHandler(response.data, response.response, response.error)
                print(response.debugDescription)
            }

        return DataTask(task: request, identifier: identifier, cancelBlock: cancelBlock)
    }
    
    private func makePatchRequestTask(with request: PatchRequestProtocol,
                                      identifier: String,
                                      completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void,
                                      cancelBlock: EmptyBlock) -> DataTaskProtocol? {
        guard let url = request.url else {
            return nil
        }
        
        let request = session()
            .request(url, method: .patch, parameters: request.bodyParameters, encoding: JSONEncoding.default, headers: HTTPHeaders(request.headers))
            .responseJSON { response in
                completionHandler(response.data, response.response, response.error)
                print(response.debugDescription)
            }
        
        return DataTask(task: request, identifier: identifier, cancelBlock: cancelBlock)
    }
    
    private func makeUploadRequestTask(with request: UploadRequestProtocol,
                                       identifier: String,
                                       completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void,
                                       cancelBlock: EmptyBlock) -> DataTaskProtocol? {
        guard let url = request.url,
              let multipartFormData = request.multipartFormData else {
            return nil
        }
        
        let request = session()
            .upload(multipartFormData: multipartFormData, to: url, method: .put, headers: HTTPHeaders(request.headers))
            .responseJSON { response in
                print(response.debugDescription)
                completionHandler(response.data, response.response, response.error)
            }
        return DataTask(task: request, identifier: identifier, cancelBlock: cancelBlock)
    }
    
    private func makeGetRequestTask(with request: GetRequestProtocol,
                                    identifier: String,
                                    completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void,
                                    cancelBlock: EmptyBlock) -> DataTaskProtocol? {
        guard let url = request.url else {
            return nil
        }

        let request = session()
            .request(url, method: .get, headers: HTTPHeaders(request.headers))
            .validate()
            .response { response in
                completionHandler(response.data, response.response, response.error)
                print(response.debugDescription)
        }
        
        return DataTask(task: request, identifier: identifier, cancelBlock: cancelBlock)
    }
}


extension Alamofire.DataRequest: URLSessionTaskProtocol {
    public var identifier: String {
        id.uuidString
    }
    
    public func cancelAndReturnSelf() -> Self {
        cancel()
    }
    
    public func resumeAndReturnSelf() -> Self {
        resume()
    }
}

protocol AlamofireSessionLocatorProtocol {
#if DEBUG
    static var debugSession:  Alamofire.Session { get }
#endif
    static func session() -> Alamofire.Session
}

extension AlamofireSessionLocatorProtocol {
    static func session() -> Alamofire.Session {
#if DEBUG
        return debugSession
#else
        return AF
#endif
    }
}

final class AlamofireSessionLocator: AlamofireSessionLocatorProtocol {
    static let debugSession: Session = Session()
    
#if DEBUG
    //static let manager = ServerTrustManager(evaluators: [SBDebugConfig.allowedSchema: DisabledTrustEvaluator()])
    //static let debugSession = Session(serverTrustManager: manager)
#endif
}
