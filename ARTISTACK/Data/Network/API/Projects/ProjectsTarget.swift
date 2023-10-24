//
//  ProjectsTarget.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/10/24.
//

import Foundation
import Alamofire

enum ProjectsTarget{
    case projectList
}

extension ProjectsTarget: TargetType {
    var baseURL: String {
        return "https://dev.artistack.xyz/"
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .projectList:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .projectList:
            return "projects/search"
        }
    }
    
    var headers: Alamofire.HTTPHeaders {
        return [HTTPHeaderField.authentication.rawValue: Authentication.accessToken.value,
                HTTPHeaderField.contentType.rawValue:
                    ContentType.json.rawValue]
    }
    
    var parameters: RequestParams {
        switch self {
        case .projectList:
            return .query("")
        }
    }
    
    
}
