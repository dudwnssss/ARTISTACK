//
//  DuplicateResponse.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import Foundation

struct DuplicateResponse: Decodable{
    let success: Bool
    let code: Int
    let message: String
    let data: Bool
}
