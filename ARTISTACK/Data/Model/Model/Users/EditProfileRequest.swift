//
//  EditProfileRequest.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/25.
//

import Foundation

struct EditProfileRequest: Encodable{
    let nickname: String?
    let description: String?
    let profileImgUrl: String?
}
