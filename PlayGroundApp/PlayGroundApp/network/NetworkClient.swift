//
//  NetworkClient.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 22.04.2023.
//

import Foundation
import Alamofire


let client = NetworkClient()


class NetworkClient {
    
    func request<T : RequestProtocol>(for request: T,
                                      result: @escaping (NetworkClientResult<T.ResponseType>) -> Void) {
        AF.request(request.url,
                   method: getRequestMethod(requestType: request.requestType),
                   parameters: request.parameters,
                   headers: getRequestHeaders(request.headers)
//                   interceptor: <#T##RequestInterceptor?#> here is auth interceptor
        ).responseDecodable(of: T.ResponseType.self) { (response) in
            switch response.result {
            case .success(let value):
                result(.success(value))
            case .failure(let error):
                result(.error(error))
            }
        }
    }
    
    private func getRequestMethod(requestType: RequestType) -> HTTPMethod {
        switch(requestType) {
            case .Get: return .get
            case .Post: return .post
            case .Put: return .put
            case .Patch: return .patch
            case .Delete: return .delete
        }
        
    }
    
    private func getRequestHeaders(_ requestHeader: [String: String]) -> HTTPHeaders {
        var headers = HTTPHeaders()
        for item in requestHeader {
            headers.add(HTTPHeader(name: item.key, value: item.value))
        }
        return headers
        
    }
}
