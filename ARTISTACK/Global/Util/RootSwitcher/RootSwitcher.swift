//
//  RootSwitcher.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import UIKit

final class RootSwitcher {
    
    enum Destination{
        case login
        case onboarding
        case main
    }
    
    static func update(_ destination: Destination){
        guard let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {return}
        switch destination {
        case .login:
            delegate.window?.rootViewController = LoginViewController()
        case .onboarding:
            let vc = OnboardingAccountViewController()
            let nav = UINavigationController(rootViewController: vc)
            delegate.window?.rootViewController = nav
        case .main:
            delegate.window?.rootViewController = MainTabBarController()
        }
    }
}
