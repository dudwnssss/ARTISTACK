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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        onboardingAccountView.textField.becomeFirstResponder()
    }
    
    override func setProperties() {
        onboardingAccountView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    @objc func nextButtonDidTap(){
        let vc = OnboardingUserNameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
