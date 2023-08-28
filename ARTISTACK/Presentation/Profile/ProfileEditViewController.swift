//
//  ProfileEditViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit

class ProfileEditViewController: BaseViewController {
    
    var isToolTipHidden = true
    
    let profileImageView = ProfileImageView()
    let separator1View = SeparatorView()
    let separator2View = SeparatorView()
    let separator3View = SeparatorView()
    lazy var toolTipView = ToolTipView(title: "닉네임은 1-14자까지 설정가능합니다.", tipPosition: .top).then{
        $0.isHidden = isToolTipHidden
    }
    
    let nicknameLabel = UILabel().then{
        $0.text = "닉네임"
        $0.font = .boldSystemFont(ofSize: 16)
    }
    let descriptionLabel = UILabel().then{
        $0.text = "소개"
        $0.font = .boldSystemFont(ofSize: 16)
    }
    let nicknameCountLabel = UILabel().then{
        $0.text = "0"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 14)
    }
    let descriptionCountLabel = UILabel().then{
        $0.text = "0"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 14)
    }
    let nicknameTextField = UITextField().then{
        $0.placeholder = "4-14자 (영문 소문자, 숫자, 밑줄 가능)"
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor = .white
    }
    let descriptionTextView = UITextView().then{
        $0.isScrollEnabled = false
        $0.text = "스태커님은 어떤 음악을 하시나요?"
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor = .white
        $0.backgroundColor = .clear
    }
    let storeButton = CompleteButton().then{
        $0.buttonTitleLabel.text = "저장하기"
    }
    
    override func setProperties() {
        hideKeyboardWhenTappedAround()
    }
    
    
    override func setLayouts() {
        view.addSubviews(profileImageView, separator1View, nicknameLabel, nicknameTextField, nicknameCountLabel, separator2View, descriptionLabel, descriptionTextView, descriptionCountLabel, separator3View, storeButton, toolTipView)
        profileImageView.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
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
        nicknameTextField.snp.makeConstraints {            $0.leading.equalTo(nicknameLabel.snp.trailing).offset(30)
            $0.trailing.equalTo(nicknameCountLabel.snp.leading).offset(-8)
            $0.centerY.equalTo(nicknameLabel)
        }
        nicknameCountLabel.snp.makeConstraints {
            $0.width.equalTo(10)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalTo(nicknameLabel)
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
            $0.leading.equalTo(nicknameTextField)
            $0.trailing.equalTo(nicknameCountLabel)
            $0.top.equalTo(descriptionLabel).offset(-6)
            $0.bottom.equalTo(separator3View.snp.top).offset(-12)
        }
        
        descriptionCountLabel.snp.makeConstraints {
            $0.trailing.equalTo(nicknameCountLabel)
            $0.bottom.equalTo(descriptionTextView)
        }
        
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
