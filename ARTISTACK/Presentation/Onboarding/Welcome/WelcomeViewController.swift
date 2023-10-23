//
//  WelcomeViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import UIKit

class WelcomViewController: BaseViewController {
    
    let backgroundImageView = UIImageView()
    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let accessoryImageView = UIImageView()
    var nickname = "아티스태커"
    
    override func setProperties() {
        backgroundImageView.do {
            $0.image = Image.onboardingBackground
            $0.contentMode = .scaleAspectFill
        }
        logoImageView.do {
            $0.image = Image.logoWithText
        }
        titleLabel.do {
            let fullString = "\(nickname) 님,\n아티스택에 오신걸 환영합니다.\n같이 스택해요!"
            let attributedString = NSMutableAttributedString(string: fullString)
            let range = (fullString as NSString).range(of: "\(nickname)")
            attributedString.addAttribute(.foregroundColor, value: Color.white, range: range)
            $0.numberOfLines = 0
            $0.textColor = Color.artistackSystem6
            $0.font = Font.bold25
            $0.attributedText = attributedString
        }
        descriptionLabel.do {
            $0.text = "클릭하여 홈 화면으로 이동하세요"
            $0.font = Font.medium15
            $0.textColor = Color.artistackSystem7
        }
        accessoryImageView.do {
            $0.image = Image.accessoryRight
        }
    }
    override func setLayouts() {
        view.addSubviews(backgroundImageView, logoImageView, titleLabel, descriptionLabel, accessoryImageView)
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        logoImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(21)
            $0.top.equalToSuperview().offset(100)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(22)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(22)
            $0.leading.equalTo(titleLabel)
        }
        accessoryImageView.snp.makeConstraints {
            $0.leading.equalTo(descriptionLabel.snp.trailing).offset(6)
            $0.centerY.equalTo(descriptionLabel)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func handleTap(){
        RootSwitcher.update(.main)
    }
    
}
