//
//  LoginResponse.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import Foundation

struct LoginResponse: Codable {
    let success: Bool
    let code: Int
    let message: String
    let data: DataClass?
}

struct DataClass: Codable {
    let grantType, accessToken, refreshToken: String?
    let accessTokenExpiresIn: Int?
}

