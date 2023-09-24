//
//  OnboardingAgreementViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import UIKit

class OnboardingAgreementViewController: BaseViewController {
    
    let onboardingAgreementView = OnboardingAgreementView()
    
    override func loadView() {
        self.view = onboardingAgreementView
    }
    
    override func setProperties() {
        onboardingAgreementView.completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
    }
    
    @objc func completeButtonDidTap(){
        let vc = WelcomViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
