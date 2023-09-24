//
//  OnboardingProfileView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import UIKit

class OnboardingProfileView : BaseView {
    let progressImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let separatorView = SeparatorView()
    let nextButton = CompleteButton(title: "다음")
    let skipButton = UIButton()
    let textCountLabel = UILabel()
    let profileImageView = ProfileImageView()
    let textView = UITextView()

    
    override func setProperties() {
        progressImageView.do {
            $0.image = UIImage(named: "onboarding.progress3")
        }
        titleLabel.do {
            $0.text = "프로필 사진과\n소개를 설정해주세요."
            $0.font = .boldSystemFont(ofSize: 26)
            $0.numberOfLines = 2
        }
        descriptionLabel.do {
            $0.text = "추후 변경이 가능합니다."
            $0.font = .boldSystemFont(ofSize: 15)
            $0.textColor = .artistackSystem7
        }
        
        skipButton.do {
            $0.setTitle("건너뛰기", for: .normal)
            $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            $0.setTitleColor(.white, for: .normal)
        }

        separatorView.do {
            $0.backgroundColor = .artistackSystem4
        }
        
        textView.do {
            $0.isScrollEnabled = false
            $0.textContainerInset = .zero
            $0.textContainer.lineFragmentPadding = 0
            $0.backgroundColor = .clear
            $0.font = .systemFont(ofSize: 18)
            $0.textContainer.maximumNumberOfLines = 2
            $0.textColor = .white
        }

        
        textCountLabel.do {
            $0.text = "38"
            $0.textColor = .artistackSystem4
            $0.textAlignment = .right
            $0.font = .systemFont(ofSize: 14)
        }

    }
    
    override func setLayouts() {
        
        addSubviews(progressImageView, titleLabel, descriptionLabel, separatorView, nextButton, skipButton, textCountLabel, profileImageView, textView)
        
        progressImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(48)
            $0.leading.equalToSuperview().offset(16)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(progressImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(22)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel)
        }
        
        profileImageView.snp.makeConstraints {
            $0.size.equalTo(122)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-64)
        }
        
        textView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(44)
            $0.leading.equalTo(titleLabel)
            $0.height.equalTo(52)
            $0.trailing.equalToSuperview().offset(-27)
        }
        
        separatorView.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalTo(textView)
            $0.top.equalTo(textView.snp.bottom)
        }
        
        textCountLabel.snp.makeConstraints {
            $0.trailing.equalTo(separatorView)
            $0.top.equalTo(separatorView.snp.bottom).offset(8)
        }
        
        skipButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(33)
            $0.bottom.equalToSuperview().offset(-57)
        }
        nextButton.snp.makeConstraints {
            $0.width.equalTo(128)
            $0.trailing.equalToSuperview().offset(-27)
            $0.centerY.equalTo(skipButton)
        }
    }
}
