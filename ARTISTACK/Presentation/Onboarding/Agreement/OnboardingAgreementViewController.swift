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
        
        guard let artistackId = UserDefaults.standard.string(forKey: "artistackId") else {return}
        guard let nickname = UserDefaults.standard.string(forKey: "nickname") else {return}
        let description = UserDefaults.standard.string(forKey: "description")
        let profileImageUrl = UserDefaults.standard.string(forKey: "profileImgUrl")
        
        print(profileImageUrl)
        
        let request = SignupRequest(artistackId: artistackId, nickname: nickname, description: description, providerType: "APPLE", profileImgUrl: profileImageUrl, instruments: nil)
        
        NetworkManager.shared.request(type: LoginResponse.self, api: OAuthTarget.signup(request)) { response in
            switch response {
            case .success(let success):
                if success.success == true{
                    UserDefaults.standard.set(success.data?.accessToken, forKey: "accessToken")
                    UserDefaults.standard.set(success.data?.refreshToken, forKey: "refressToken")
                    let vc = WelcomViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            case .failure(let failure):
                debugPrint(response)
            }
        }
    }
}
