//
//  UploadTarget.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/12/19.
//

import Foundation
import Alamofire

enum UploadTarget{
    case profile(imageData: Data, request: UploadRequest)
}

extension UploadTarget: TargetType {
    
    var multipart: MultipartFormData {
        switch self {
        case .profile(let imageData, _):
            let multipart = MultipartFormData()
            multipart.append(imageData, withName: "file", fileName: "imagefile.png", mimeType: "image/png")
            return multipart
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .profile:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .profile:
            return "upload/profile"
        }
    }
    
    var headers: Alamofire.HTTPHeaders {
        return []
    }
    
    var parameters: RequestParams {
        switch self {
        case .profile(_, let request):
            return .query(request)
        }
    }
    
    
}
