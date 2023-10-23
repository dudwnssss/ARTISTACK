//
//  OnboardingAgreementView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import UIKit

class OnboardingAgreementView: BaseView {
    let progressImageView = UIImageView()
    let titleLabel = UILabel()
    let allAgreeLabel = UILabel()
    let allAgreeButton = UIButton()
    let termLabel = UILabel()
    let privacyLabel = UILabel()
    let marketingLabel = UILabel()
    let termButton = UIButton()
    let privacyButton = UIButton()
    let marketingButton = UIButton()
    let completeButton = CompleteButton(title: "완료")
    


    override func setProperties() {
        progressImageView.do {
            $0.image = UIImage(named: "onboarding.progress4")
        }
        titleLabel.do {
            $0.text = "다 왔어요!\n이용 약관을 확인해주세요."
            $0.font = .boldSystemFont(ofSize: 26)
            $0.numberOfLines = 2
        }
        allAgreeLabel.do {
            $0.text = "아래 약관에 모두 동의하기"
            $0.font = .systemFont(ofSize: 18)
        }
        allAgreeButton.do {
            $0.setImage(UIImage(named: "agreement.large"), for: .normal)
        }
        termLabel.do {
            $0.font = .systemFont(ofSize: 16)
            let fullstring = "(필수) 서비스 이용 약관 동의"
            let attributedString = NSMutableAttributedString(string: fullstring)
            let range1 = (fullstring as NSString).range(of: "(필수)")
            let range2 = (fullstring as NSString).range(of: "동의")
            attributedString.addAttribute(.foregroundColor, value: Color.artistackSystem6, range: range1)
            attributedString.addAttribute(.foregroundColor, value: Color.artistackSystem6, range: range2)
            $0.textColor = Color.white
            $0.attributedText = attributedString
        }
        termButton.do {
            $0.setImage(UIImage(named: "agreement"), for: .normal)
        }
        privacyLabel.do {
            $0.font = .systemFont(ofSize: 16)
            let fullstring = "(필수) 개인정보 처리방침 동의"
            let attributedString = NSMutableAttributedString(string: fullstring)
            let range1 = (fullstring as NSString).range(of: "(필수)")
            let range2 = (fullstring as NSString).range(of: "동의")
            attributedString.addAttribute(.foregroundColor, value: Color.artistackSystem6, range: range1)
            attributedString.addAttribute(.foregroundColor, value: Color.artistackSystem6, range: range2)
            $0.textColor = Color.white
            $0.attributedText = attributedString
        }
        privacyButton.do {
            $0.setImage(UIImage(named: "agreement"), for: .normal)
        }
        marketingLabel.do {
            $0.font = .systemFont(ofSize: 16)
            let fullstring = "(선택) 마케팅 정보 수신 동의"
            let attributedString = NSMutableAttributedString(string: fullstring)
            let range1 = (fullstring as NSString).range(of: "(선택)")
            let range2 = (fullstring as NSString).range(of: "동의")
            attributedString.addAttribute(.foregroundColor, value: Color.artistackSystem6, range: range1)
            attributedString.addAttribute(.foregroundColor, value: Color.artistackSystem6, range: range2)
            $0.textColor = Color.white
            $0.attributedText = attributedString
        }
        marketingButton.do {
            $0.setImage(UIImage(named: "agreement"), for: .normal)
        }
    }
    
    override func setLayouts() {
        addSubviews(progressImageView, titleLabel, allAgreeLabel, allAgreeButton, termLabel, termButton, privacyLabel, privacyButton, marketingLabel, marketingButton,completeButton)
        
        progressImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(16)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(progressImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(22)
        }
        allAgreeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-68)
            $0.leading.equalToSuperview().offset(23)
        }
        allAgreeButton.snp.makeConstraints {
            $0.centerY.equalTo(allAgreeLabel)
            $0.trailing.equalToSuperview().offset(-18)
        }
        termLabel.snp.makeConstraints {
            $0.leading.equalTo(allAgreeLabel)
            $0.top.equalTo(allAgreeLabel.snp.bottom).offset(35)
        }
        termButton.snp.makeConstraints {
            $0.centerX.equalTo(allAgreeButton)
            $0.centerY.equalTo(termLabel)
        }
        privacyLabel.snp.makeConstraints {
            $0.leading.equalTo(allAgreeLabel)
            $0.top.equalTo(termLabel.snp.bottom).offset(28)
        }
        privacyButton.snp.makeConstraints {
            $0.centerX.equalTo(allAgreeButton)
            $0.centerY.equalTo(privacyLabel)
        }
        marketingLabel.snp.makeConstraints {
            $0.leading.equalTo(allAgreeLabel)
            $0.top.equalTo(privacyLabel.snp.bottom).offset(28)
        }
        marketingButton.snp.makeConstraints {
            $0.centerX.equalTo(allAgreeButton)
            $0.centerY.equalTo(marketingLabel)
        }
        completeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-27)
            $0.bottom.equalToSuperview().offset(-46)
        }
        
    }
  
}
