//
//  OnboardingUserNameView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import UIKit

class OnboardingUserNameView: BaseView {
    let progressImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let textField = UITextField()
    let separatorView = SeparatorView(isUnderLine: true)
    let constraintsLabel = UILabel()
    let nextButton = UIButton()
    let accessoryLabel = UILabel()
    lazy var accessoryView: UIView = {
        return UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 54))
    }()


    override func setProperties() {
        progressImageView.do {
            $0.image = UIImage(named: "onboarding.progress2")
        }
        titleLabel.do {
            $0.text = "사용자님을 타나낼\n이름을 작성해주세요."
            $0.font = Font.bold26
            $0.numberOfLines = 2
        }
        descriptionLabel.do {
            $0.text = "추후 변경이 가능합니다."
            $0.font = Font.bold15
            $0.textColor = Color.artistackSystem7
        }
        
        nextButton.do {
            $0.setImage(UIImage(named: "onboarding.next.activated"), for: .normal)
            $0.setTitle("다음", for: .normal)
            $0.setTitleColor(Color.white, for: .normal)
        }

        accessoryLabel.do {
            $0.text = "다음"
            $0.font = Font.bold19
        }

        textField.do {
            $0.attributedPlaceholder = NSAttributedString(string: "Ex) artistacker_12", attributes: [.foregroundColor: Color.artistackSystem3])
            $0.textColor = Color.white
            $0.font = Font.bold23
            $0.inputAccessoryView = accessoryView
        }
        separatorView.do {
            $0.backgroundColor = Color.artistackSystem4
        }
        constraintsLabel.do {
            $0.text = "한글, 영문, 숫자, 특수기호, 이모지 등 입력가능 (총 1-14자)"
            $0.textColor = Color.artistackSystem4
            $0.font = Font.medium14
        }
    }
    
    override func setLayouts() {
        accessoryView.addSubviews(nextButton, accessoryLabel)
        
        addSubviews(progressImageView, titleLabel, descriptionLabel, separatorView, textField, constraintsLabel)
        accessoryLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        nextButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        progressImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
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
        
        separatorView.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-30)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-27)
        }
        
        textField.snp.makeConstraints {
            $0.trailing.leading.equalTo(separatorView)
            $0.bottom.equalTo(separatorView.snp.top).offset(-9)
        }
        constraintsLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(8)
            $0.leading.equalTo(separatorView)
        }
    }
    
  
}
