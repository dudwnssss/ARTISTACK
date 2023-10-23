//
//  LoginView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import UIKit

class LoginView: BaseView{
    private let bgImageView = UIImageView()
    private let logoImageView = UIImageView()
    private let titleLabel = UILabel()
    private let exsitLabel = UILabel()
    private let leftAccessoryImageView = UIImageView()
    private let rightAccessoryImageView = UIImageView()
    private let descriptionLabel = UILabel()
    let kakaoLoginButton = LoginButton(loginType: .kakao)
    let appleLoginButton = LoginButton(loginType: .apple)
    
    
    override func setProperties() {
        bgImageView.do {
            $0.image = UIImage(named: "splash.blur")
            $0.contentMode = .scaleAspectFill
        }
        logoImageView.do {
            $0.image = UIImage(named: "logo")
        }
        titleLabel.do {
            let fullString = "당신의 음악을\n스택해보세요"
            let attributedString = NSMutableAttributedString(string: fullString)
            let range = (fullString as NSString).range(of: "당신의 음악")
            let font = Font.bold26
            let color = UIColor.white
            attributedString.addAttributes([.foregroundColor: color, .font: font], range: range)
            $0.font = Font.medium26
            $0.attributedText = attributedString
            $0.textAlignment = .center
            $0.numberOfLines = 0
        }
        leftAccessoryImageView.do {
            $0.image = UIImage(named: "accessory.left")
        }
        rightAccessoryImageView.do {
            $0.image = UIImage(named: "accessory.right")
        }

        exsitLabel.do {
            $0.text = "기존 회원이신가요?"
            $0.font = Font.medium13
            $0.textColor = Color.artistackSystem8
        }
        descriptionLabel.do {
            $0.text = "기존 가입 경로를 통해 로그인해주세요"
            $0.font = Font.medium13
            $0.textColor = Color.artistackSystem8.withAlphaComponent(0.6)
        }
    }
    override func setLayouts() {
        addSubviews(bgImageView, logoImageView, titleLabel, exsitLabel, descriptionLabel, leftAccessoryImageView, rightAccessoryImageView ,appleLoginButton)
        bgImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-105)
            $0.centerX.equalToSuperview()
        }
        exsitLabel.snp.makeConstraints {
            $0.bottom.equalTo(descriptionLabel.snp.top).offset(-15)
            $0.centerX.equalToSuperview()
        }
        leftAccessoryImageView.snp.makeConstraints {
            $0.trailing.equalTo(exsitLabel.snp.leading).offset(-8)
            $0.centerY.equalTo(exsitLabel)
        }
        rightAccessoryImageView.snp.makeConstraints {
            $0.leading.equalTo(exsitLabel.snp.trailing).offset(8)
            $0.centerY.equalTo(exsitLabel)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImageView.snp.bottom).offset(12)
        }
        appleLoginButton.snp.makeConstraints {
            $0.bottom.equalTo(exsitLabel.snp.top).offset(-47)
            $0.horizontalEdges.equalToSuperview().inset(40)
        }

    }
    
}
