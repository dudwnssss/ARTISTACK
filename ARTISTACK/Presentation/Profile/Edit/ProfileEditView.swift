//
//  ProfileEditView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class ProfileEditView: BaseView {
    
    var isToolTipHidden = true
    
    let profileImageView = ProfileImageView()
    let separator1View = SeparatorView()
    let separator2View = SeparatorView()
    let separator3View = SeparatorView()
    let profileEditButton = UIButton()
    
    
    lazy var toolTipView = ToolTipView(title: "닉네임은 1-14자까지 설정가능합니다.", tipPosition: .top).then{
        $0.isHidden = isToolTipHidden
    }
    
    let nicknameLabel = UILabel().then{
        $0.configureTitle(title: "닉네임", titleType: .sub)
    }
    let descriptionLabel = UILabel().then{
        $0.configureTitle(title: "소개", titleType: .sub)
    }
    
    let nicknameTextFieldView = CustomTextFieldView(placeholder: "4-14자 (영문 소문자, 숫자, 밑줄 가능)", limitCount: 14, fontSize: 14, isBold: true)

    let descriptionTextView = CustomTextView(placeholder: "스태커님은 어떤 음악을 하시나요?", limitCount: 38, fontSize: 14, isBold: true)
    
    let storeButton = CompleteButton(title: "저장하기")
    
    override func setLayouts() {
        addSubviews(profileImageView, separator1View, nicknameLabel, nicknameTextFieldView, separator2View, descriptionTextView, descriptionLabel, separator3View, storeButton, toolTipView, profileEditButton)
        profileImageView.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(20)
        }
        profileEditButton.snp.makeConstraints {
            $0.size.equalTo(profileImageView)
            $0.center.equalTo(profileImageView)
        }
        
        separator1View.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(22)
            $0.horizontalEdges.equalToSuperview()
        }
        nicknameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(42)
            $0.top.equalTo(separator1View.snp.bottom).offset(12)
        }
        
        nicknameTextFieldView.snp.makeConstraints {
            $0.leading.equalTo(nicknameLabel.snp.trailing).offset(30)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(28)
            $0.top.equalTo(nicknameLabel)
        }
        
        separator2View.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(separator2View.snp.bottom).offset(12)
        }
        descriptionTextView.snp.makeConstraints {
            $0.leading.trailing.equalTo(nicknameTextFieldView)
            $0.top.equalTo(descriptionLabel)
            $0.bottom.equalTo(separator3View.snp.top).offset(-12)
        }
        descriptionTextView.layoutSubviews()
        
        separator3View.snp.makeConstraints {
            $0.top.equalTo(separator2View.snp.bottom).offset(106)
            $0.horizontalEdges.equalToSuperview()
        }
        
        storeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-46)
            $0.width.equalTo(128)
            $0.centerX.equalToSuperview()
        }
        toolTipView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(nicknameLabel.snp.bottom)
            $0.height.equalTo(44)
        }
        switch isToolTipHidden{
        case true:
            descriptionLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(20)
                $0.top.equalTo(separator2View.snp.bottom).offset(12)
            }
        case false:
            descriptionLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(20)
                $0.top.equalTo(toolTipView.snp.bottom).offset(12)
            }
        }
        
    }
    
}
