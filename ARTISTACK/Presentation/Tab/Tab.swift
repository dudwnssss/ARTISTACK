//
//  Tap.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit

enum Tab: Int, CaseIterable {
    case home
    case record
    case profile
    
    var image: UIImage {
        switch self {
        case .home:
            return Image.home
        case .record:
            return Image.record
        case .profile:
            return Image.profile
        }
    }
}
