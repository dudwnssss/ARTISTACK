//
//  UploadResponse.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/12/19.
//

import Foundation

struct UploadResponse : Codable {
    var success: Bool
    var code: Int
    var message: String
    var data: String?
}
