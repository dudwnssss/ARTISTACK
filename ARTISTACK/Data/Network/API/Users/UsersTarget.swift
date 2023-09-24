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
    case myProfile
}

extension UsersTarget: TargetType{
    var baseURL: String {
        return "https://dev.artistack.xyz/"
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .duplicate:
            return .get
        case .myProfile:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .duplicate:
            return "users/duplicate"
        case .myProfile:
            return "users/me"
        }
    }
    
    var headers: Alamofire.HTTPHeaders {
        switch self{
        case .duplicate(_):
            return [HTTPHeaderField.authentication.rawValue: Authentication.authorization.value,
                    HTTPHeaderField.contentType.rawValue:
                        ContentType.json.rawValue]
        case .myProfile:
            return [HTTPHeaderField.authentication.rawValue: Authentication.accessToken.value,
                    HTTPHeaderField.contentType.rawValue:
                        ContentType.json.rawValue]
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .duplicate(let request):
            return .query(request)
        case .myProfile:
            return .query("")
        }
    }
    
}
