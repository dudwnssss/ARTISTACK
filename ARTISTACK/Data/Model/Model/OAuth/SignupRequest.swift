//
//  SignupRequest.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import Foundation

struct SignupRequest: Encodable{
    let artistackId: String
    let nickname: String
    let description: String?
    let providerType: String
    let profileImgUrl: String?
    let instruments: [Instrument]?
}

struct Instrument: Codable{
    let id: Int
}
