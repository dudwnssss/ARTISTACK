//
//  AppDelegate.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 15.0, *) {
            //            let appearance = UINavigationBarAppearance()
            //            appearance.configureWithDefaultBackground()
            //            let backButtonAppearance = UIBarButtonItemAppearance()
            //            backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear, .font: UIFont.systemFont(ofSize: 0)]
            //            let backButtonImage = UIImage(named: "back6")
            //            appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
            //            appearance.backButtonAppearance = backButtonAppearance
            //            appearance.backgroundColor = .artistackSystem1
            //            UINavigationBar.appearance().isTranslucent = false
            //            UINavigationBar.appearance().standardAppearance = appearance
            //            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            //            UINavigationBar.appearance().tintColor = .white
            
            
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            let backButtonAppearance = UIBarButtonItemAppearance()
            backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear, .font: UIFont.systemFont(ofSize: 0)]
            let backButtonImage = UIImage(named: "back6")
            appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
            appearance.backButtonAppearance = backButtonAppearance
            UINavigationBar.appearance().isTranslucent = true
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().tintColor = .white
            
        }
        
        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()
            UITabBar.appearance().barTintColor = .artistackSystem1
            UITabBar.appearance().backgroundColor = .artistackSystem1
            UITabBar.appearance().isTranslucent = false
        }
        UILabel.appearance().textColor = .white
        sleep(1)
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

