//
//  WithdrawResponse.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/26.
//

import Foundation

struct WithdrawResponse: Decodable {
    let success: Bool
    let code: Int
    let message: String
    let data: Bool
}
