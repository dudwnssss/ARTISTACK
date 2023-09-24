//
//  UsersTarget.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import Foundation
import Alamofire

enum UsersTarget{
    case duplicate(DuplicateRequest)
}

extension UsersTarget: TargetType{
    var baseURL: String {
        return "https://dev.artistack.xyz/"
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .duplicate:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .duplicate:
            return "users/duplicate"
        }
    }
    
    var headers: Alamofire.HTTPHeaders {
        return [HTTPHeaderField.authentication.rawValue: Authentication.authorization.value,
                       HTTPHeaderField.contentType.rawValue:
                           ContentType.json.rawValue]
    }
    
    var parameters: RequestParams {
        switch self {
        case .duplicate(let request):
            return .query(request)
        }
    }
    
}
