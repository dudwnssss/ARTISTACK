//
//  TargetType.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import Foundation
import Alamofire

protocol TargetType: URLRequestConvertible {
    var baseURL: String {get}
    var method: HTTPMethod {get}
    var path: String {get}
    var headers: HTTPHeaders {get}
    var parameters: RequestParams {get}
    var multipart: MultipartFormData {get}
}

extension TargetType {

    var baseURL: String {
        return URLConstant.baseURL
    }
    
    var multipart: MultipartFormData {
        return MultipartFormData()
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)
        urlRequest.headers = headers
        
        switch parameters {
        case .query(let request):
            let params = request?.toDictionary() ?? [:]
            let queryParams = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
        case .body(let request):
            let params = request?.toDictionary() ?? [:]
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        }

        return urlRequest
    }
}





enum RequestParams {
    case query(_ parameter: Encodable?)
    case body(_ parameter: Encodable?)
}

extension Encodable {
    func toDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self),
              let jsonData = try? JSONSerialization.jsonObject(with: data),
              let dictionaryData = jsonData as? [String: Any] else {return [:]}
        return dictionaryData
    }
}
