//
//  LoginViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import UIKit

class LoginViewController: BaseViewController {
    
    let loginView = LoginView()
    
    override func loadView() {
        self.view = loginView
    }
}
