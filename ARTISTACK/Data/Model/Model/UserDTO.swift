//
//  User.swift
//  Practice_Artistack
//
//  Created by csh on 2022/08/09.
//

import Foundation

struct UserDTO: Codable {
    let artistackId: String
    let nickname: String
    let profileImgUrl: String?
}
