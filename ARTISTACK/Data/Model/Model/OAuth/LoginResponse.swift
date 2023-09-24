//
//  LoginResponse.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import Foundation

struct LoginResponse: Decodable {
    let success: Bool
    let code: Int
    let message: String
    let data: DataClass?
}

struct DataClass: Decodable {
    let grantType, accessToken, refreshToken: String?
    let accessTokenExpiresIn: Int?
}

