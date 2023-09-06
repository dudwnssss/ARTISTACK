//
//  UINavigationController+.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/03.
//

import UIKit

extension UINavigationController {
    
    
    func setClearNavigationBarAppearance() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            let backButtonImage = UIImage(named: "back6")
            appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
            navigationBar.isTranslucent = true
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
    }
}
