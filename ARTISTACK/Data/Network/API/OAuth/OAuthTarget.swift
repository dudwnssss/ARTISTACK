//
//  LoginTarget.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import Foundation
import Alamofire

enum OAuthTarget{
    case login(LoginRequest)
    case signup(SignupRequest)
}

extension OAuthTarget: TargetType {
    var headers: Alamofire.HTTPHeaders {
        switch self {
        case .login(_):
            return [HTTPHeaderField.authentication.rawValue: Authentication.appleIdentity.value,
                    HTTPHeaderField.contentType.rawValue:
                        ContentType.json.rawValue]
        case .signup:
            return [HTTPHeaderField.authentication.rawValue: Authentication.authorization.value,
                    HTTPHeaderField.contentType.rawValue:
                        ContentType.json.rawValue]
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .login:
            return .get
        case .signup:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "oauth/sign-in"
        case .signup:
            return "oauth/sign-up"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .login(let request):
            return .query(request)
        case .signup(let request):
            return .body(request)
        }
    }
}
