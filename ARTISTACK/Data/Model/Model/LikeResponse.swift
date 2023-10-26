//
//  LikeResponse.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/10/25.
//

import Foundation

struct LikeResponse : Codable {
    var success: Bool
    var code: Int
    var message: String
    var data: String?
}
