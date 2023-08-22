//
//  Tap.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit

enum Tab: Int, CaseIterable {
    case home
    case profile
    
    var image: UIImage {
        switch self {
        case .home:
            return UIImage(named: "home")!
        case .profile:
            return UIImage(named: "profile")!
        }
    }
    
    var selectedImage: UIImage {
        switch self {
        case .home:
            return UIImage(named: "home.selected")!
        case .profile:
            return UIImage(named: "profile.selected")!
        }
    }
}
