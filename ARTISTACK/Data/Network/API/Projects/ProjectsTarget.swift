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
    case myProject
    case like(projectId: Int)
    case likeCancel(projectId: Int)
}

extension ProjectsTarget: TargetType {
    var baseURL: String {
        return "https://dev.artistack.xyz/"
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .projectList:
            return .get
        case .myProject:
            return .get
        case .like:
            return .post
        case .likeCancel:
            return .delete
        }
    }
    
    var path: String {
        switch self {
        case .projectList:
            return "projects/search"
        case .myProject:
            return "projects/me"
        case .like(let projectId):
            return "projects/\(projectId)/like"
        case .likeCancel(let projectId):
            return "projects/\(projectId)/like"
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
        case .myProject:
            return .query("")
        case .like:
            return .query("")
        case .likeCancel:
            return .query("")
        }
    }
    
    
}
