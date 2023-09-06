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
            return UIImage(named: "home")!
        case .record:
            return StackButton.shared.stackType.buttonImage
        case .profile:
            return UIImage(named: "profile")!
        }
    }
}
