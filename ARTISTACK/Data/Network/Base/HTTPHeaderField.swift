//
//  HTTPHeaderField.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import Foundation
import Alamofire

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
}

enum ContentType: String {
    case json = "application/json;charset=UTF-8"
}

enum Authentication: String {
    case appleIdentity
    case authorization
    
    var value: String{
        switch self{
        case .appleIdentity:
             let identityToken = UserDefaults.standard.string(forKey: "apple_identity_token")!
            return "Bearer " + identityToken
        case .authorization:
             let authorizationCode =
                    UserDefaults.standard.string(forKey: "apple_authorization_code")!
            return "Bearer " + authorizationCode
        }
    }
}
