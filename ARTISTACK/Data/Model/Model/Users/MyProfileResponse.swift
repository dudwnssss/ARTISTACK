//
//  MyProfile.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/25.
//

import Foundation

// MARK: - Empty
struct MyProfileResponse: Decodable {
    let success: Bool
    let code: Int
    let message: String
    let data: UserData
}

// MARK: - DataClass
struct UserData: Decodable {
    let artistackId: String
    let nickname: String
    let description: String?
    let profileImgUrl: String?
    let providerType, role: String
}

struct Test{
    let hi: String
}
