//
//  OnboardingUserNameViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import UIKit

class OnboardingUserNameViewController : BaseViewController {
    
    let onboardingUserNameView = OnboardingUserNameView()
    override func loadView() {
        self.view = onboardingUserNameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingUserNameView.textField.becomeFirstResponder()
    }
}
