//
//  OnbaordingAccountViewController.swift.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import Foundation

class OnboardingAccountViewController: BaseViewController{
    
    let onboardingAccountView = OnboardingAccountView()
    let onboardingAccountViewModel = OnboardingAccountViewModel()
    var timer: Timer?
    
    override func loadView() {
        self.view = onboardingAccountView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        onboardingAccountView.textField.becomeFirstResponder()
    }
    
    override func setProperties() {
        onboardingAccountView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        onboardingAccountView.textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func nextButtonDidTap(){
        let vc = OnboardingUserNameViewController()
        let id = onboardingAccountView.textField.text
        UserDefaults.standard.set(id, forKey: "artistackId")
        vc.modalTransitionStyle = .crossDissolve
        navigationController?.pushViewController(vc, animated: false)
    }
    
    override func bind() {
        onboardingAccountViewModel.idText.bind { [weak self] text in
            self?.onboardingAccountView.textField.text = text
        }
        onboardingAccountViewModel.constaintText.bind { [weak self] text in
            self?.onboardingAccountView.constraintsLabel.text = text
        }
    }
    @objc func textFieldDidChange(){
        onboardingAccountViewModel.idText.value = onboardingAccountView.textField.text!
        onboardingAccountViewModel.checkValidate()
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(checkDuplicate), userInfo: nil, repeats: false)
    }
    
    @objc func checkDuplicate(){
        onboardingAccountViewModel.checkDuplicate()
    }
    
}
