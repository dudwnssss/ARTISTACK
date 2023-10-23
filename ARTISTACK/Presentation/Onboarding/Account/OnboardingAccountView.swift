//
//  OnboardingAccountView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import UIKit

class OnboardingAccountView: BaseView {
    
    let progressImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let tagLabel = UILabel()
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
            $0.image = UIImage(named: "onboarding.progress1")
        }
        titleLabel.do {
            $0.text = "스택을 시작할 계정을\n만들어볼까요?"
            $0.font = .boldSystemFont(ofSize: 26)
            $0.numberOfLines = 2
        }
        descriptionLabel.do {
            let fullString = "현재 입력하는 아이디는 추후 변경이 불가능합니다.\n스태커님만의 고유한 아이디를 만들어주세요."
            let attributedString = NSMutableAttributedString(string: fullString)
            let range = (fullString as NSString).range(of: "현재 입력하는 아이디는 추후 변경이 불가능합니다.")
            let font = UIFont.boldSystemFont(ofSize: 15)
            attributedString.addAttributes([.foregroundColor: Color.artistackSystem7, .font: font], range: range)
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = Color.artistackSystem4
            $0.attributedText = attributedString
        }
        nextButton.do {
            $0.setImage(UIImage(named: "onboarding.next.activated"), for: .normal)
            $0.setTitle("다음", for: .normal)
            $0.setTitleColor(Color.white, for: .normal)
        }

        tagLabel.do {
            $0.text = "@"
            $0.font = .boldSystemFont(ofSize: 26)
        }
        
        accessoryLabel.do {
            $0.text = "다음"
            $0.font = .boldSystemFont(ofSize: 19)
        }

        textField.do {
            $0.attributedPlaceholder = NSAttributedString(string: "artistack1234", attributes: [.foregroundColor: Color.artistackSystem3])
            $0.textColor = Color.white
            $0.font = .boldSystemFont(ofSize: 23)
            $0.inputAccessoryView = accessoryView
        }
        separatorView.do {
            $0.backgroundColor = Color.artistackSystem4
        }
        constraintsLabel.do {
            $0.text = "영문 소문자, 숫자, 밑줄기호 입력 가능 (총 4-17자)"
            $0.textColor = Color.artistackSystem4
            $0.font = .systemFont(ofSize: 14)
        }
    }
    
    override func setLayouts() {
        accessoryView.addSubviews(nextButton, accessoryLabel)
        
        addSubviews(progressImageView, titleLabel, descriptionLabel, separatorView, tagLabel, textField, constraintsLabel)
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
        
        tagLabel.snp.makeConstraints {
            $0.bottom.equalTo(separatorView.snp.top).offset(-7)
            $0.leading.equalToSuperview().offset(25)
        }
        
        textField.snp.makeConstraints {
            $0.trailing.equalTo(separatorView)
            $0.leading.equalTo(tagLabel.snp.trailing).offset(9)
            $0.centerY.equalTo(tagLabel)
        }
        constraintsLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(8)
            $0.leading.equalTo(separatorView)
        }
    }
    
  
}
