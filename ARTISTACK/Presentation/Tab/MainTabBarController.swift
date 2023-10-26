//
//  MainTabBarController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers()
        setTabBarItemImageInsets()
        self.tabBar.tintColor = Color.white
        self.delegate = self
    }
}

extension MainTabBarController {
    func setTabBarItemImageInsets() {
        viewControllers?.forEach {
            if $0.tabBarItem.title == nil {
                $0.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            }
        }
    }
    
    private func setViewControllers() {
        
        
        let homeVC = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeVC)
        homeNavigationController.tabBarItem = UITabBarItem(title: nil, image: Tab.home.image, tag: 0)
        
        let recordVC = RecordViewController()
        recordVC.tabBarItem = UITabBarItem(title: nil, image: Tab.record.image, tag: 1)
        
        let profileVC = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        profileNavigationController.tabBarItem = UITabBarItem(title: nil, image: Tab.profile.image, tag: 2)
        
        super.setViewControllers([
            homeNavigationController,
            recordVC,
            profileNavigationController
        ], animated: true)
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            let recordVC = RecordViewController()
            let nav = UINavigationController(rootViewController: recordVC)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
            return false
        }
        return true
    }
    
    
}

