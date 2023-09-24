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
    
}
