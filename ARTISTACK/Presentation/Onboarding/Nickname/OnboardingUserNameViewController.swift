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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        onboardingUserNameView.textField.becomeFirstResponder()
    }
    
    override func setProperties() {
        onboardingUserNameView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    @objc func nextButtonDidTap(){
        let vc = OnboardingProfileViewController()
        let nickname = onboardingUserNameView.textField.text
        UserDefaults.standard.set(nickname, forKey: "nickname")
        navigationController?.pushViewController(vc, animated: true)
    }
}
