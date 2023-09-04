//
//  UINavigationController+.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/03.
//

import UIKit

extension UINavigationController {
    
    
    func setNavigationBarAppearance(isClear: Bool) {
        if isClear {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            navigationBar.isTranslucent = true
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
        } else {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            let backButtonAppearance = UIBarButtonItemAppearance()
            backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear, .font: UIFont.systemFont(ofSize: 0)]
            let backButtonImage = UIImage(named: "back6")
            appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
            appearance.backButtonAppearance = backButtonAppearance
            appearance.backgroundColor = .artistackSystem1
            navigationBar.isTranslucent = false
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.tintColor = .white
        }
        navigationController?.setNeedsStatusBarAppearanceUpdate()
    }
}
