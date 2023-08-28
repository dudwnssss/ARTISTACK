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
        self.tabBar.tintColor = .white
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
        homeNavigationController.navigationBar.isHidden = true
        
        let recordVC = RecordViewController()
        let recordNavigationController = UINavigationController(rootViewController: recordVC)
        recordNavigationController.tabBarItem = UITabBarItem(title: nil, image: Tab.record.image, tag: 1)
        recordNavigationController.navigationBar.isHidden = true
        
        let profileVC = ProfileViewController()
        let myPageNavigationController = UINavigationController(rootViewController: profileVC)
        myPageNavigationController.tabBarItem = UITabBarItem(title: nil, image: Tab.profile.image, tag: 2)
        
        super.setViewControllers([
            homeNavigationController,
            recordNavigationController,
            myPageNavigationController
        ], animated: true)
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            // Present View Controller
            let recordVC = RecordViewController()
            recordVC.modalPresentationStyle = .fullScreen
            present(recordVC, animated: true)
            return false
        }
        return true
    }
    
    
}

