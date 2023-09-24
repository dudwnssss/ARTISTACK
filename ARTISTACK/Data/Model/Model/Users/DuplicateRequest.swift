//
//  DuplicateRequest.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import Foundation

struct DuplicateRequest: Encodable{
    let type: String = "artistackId"
    let value: String
}
