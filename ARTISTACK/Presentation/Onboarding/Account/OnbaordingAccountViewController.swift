//
//  OnbaordingAccountViewController.swift.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import Foundation

class OnboardingAccountViewController: BaseViewController{
    
    let onboardingAccountView = OnboardingAccountView()
    
    override func loadView() {
        self.view = onboardingAccountView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingAccountView.textField.becomeFirstResponder() 
    }
    
    
}
