//
//  UploadView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class UploadView: BaseView {
    
    let scrollView = UIScrollView().then{
        $0.showsVerticalScrollIndicator = false
    }
    let contentView = UIView()
    
    let separator1View = SeparatorView()
    let titleTextFieldView = InfoTextFieldView().then{
        $0.underLineView.isHidden = true
        $0.textCountLabel.text = "18"
        $0.infoTextField.placeholder = "프로젝트 제목을 입력해주세요"
        $0.infoTextField.font = .boldSystemFont(ofSize: 16)
    }
    
    let titleTextField = UITextField().then{
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = .white
        $0.placeholder = "프로젝트 제목을 입력해주세요"
    }
    let titleCountLabel = UILabel().then{
        $0.text = "18"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 14)
    }
    
    let separator2View = SeparatorView()

    
    let descriptionTextView = UITextView().then{
        $0.isScrollEnabled = false
        $0.text = "연주에 대해 설명해주세요"
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = .white
        $0.backgroundColor = .clear
        $0.textContainer.lineFragmentPadding = 0
        $0.textContainerInset = .zero
    }
    
    let descriptionCountLabel = UILabel().then{
        $0.text = "48"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 14)
    }
    
    let thumbnailImageView = UIImageView().then{
        $0.backgroundColor = .yellow
        $0.layer.cornerRadius = 3
        $0.clipsToBounds = true
    }
    
    let separator3View = SeparatorView()

    let infoLabel = UILabel().then{
        $0.text = "곡정보"
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    let bpmLabel = UILabel().then{
        $0.text = "BPM"
        $0.font = .boldSystemFont(ofSize: 16)
    }
    
    
    let bpmTextFieldView = InfoTextFieldView().then{
        $0.infoTextField.placeholder = "Ex) 123"
        $0.textCountLabel.text = "26"
    }
    
    let codeLabel = UILabel().then{
        $0.text = "코드진행"
        $0.font = .boldSystemFont(ofSize: 16)
    }
    
    let codeTextFieldView = InfoTextFieldView().then{
        $0.infoTextField.placeholder = "Ex) C F Am Dm"
        $0.textCountLabel.text = "26"
    }
    
    let instLabel = UILabel().then{
        $0.text = "악기선택"
        $0.font = .boldSystemFont(ofSize: 16)
    }
    
    let pianoButton = InstButton(type: .piano)
    let guitarButton = InstButton(type: .guitar)
    let bassButton = InstButton(type: .bass)
    let drumButton = InstButton(type: .drum)
    let vocalButton = InstButton(type: .vocal)
    let othersButton = InstButton(type: .others)
    
    let separator4View = SeparatorView()
    
    let settingLabel = UILabel().then{
        $0.text = "설정"
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    let publicSettingLabel =  UILabel().then{
        $0.text = "공개 설정"
        $0.font = .boldSystemFont(ofSize: 16)
    }
    
    let publicSettingSwitch = UISwitch().then{
        $0.onTintColor = .systemBlue
    }
    
    let stackAllowLabel = UILabel().then{
        $0.text = "스택 허용"
        $0.font = .boldSystemFont(ofSize: 16)
    }

    let stackAllowSwitch = UISwitch().then{
        $0.onTintColor = .systemBlue
    }
    
    let uploadButon = CompleteButton().then{
        $0.buttonTitleLabel.text = "게시하기"
    }
    
    let instTopStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
    }
    let instBottomStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
    }
    let instStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .vertical
    }
    
    let tooltipView = ToolTipView(title: "제목을 작성해주세요!", tipPosition: .bottom, isRounded: true)
    
    override func setLayouts() {
        addSubviews(scrollView, uploadButon, tooltipView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        scrollView.addSubviews(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().offset(72)
        }
        contentView.addSubviews(separator1View, titleTextFieldView, titleTextField, titleCountLabel, separator2View, descriptionTextView, descriptionCountLabel, thumbnailImageView, separator3View, infoLabel, bpmLabel, bpmTextFieldView, codeLabel, codeTextFieldView, instLabel, instStackView, separator4View, settingLabel, publicSettingLabel, publicSettingSwitch, stackAllowLabel, stackAllowSwitch)
        
        separator1View.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        separator2View.snp.makeConstraints {
            $0.top.equalTo(separator1View.snp.bottom).offset(57)
            $0.horizontalEdges.equalToSuperview()
        }
        
        separator3View.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(separator2View.snp.bottom).offset(170)
        }
        
        titleTextFieldView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(separator1View.snp.bottom).offset(20)
            $0.height.equalTo(30)
        }
        
        thumbnailImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(separator2View.snp.bottom).offset(20)
            $0.bottom.equalTo(separator3View.snp.top).offset(-20)
            $0.width.equalTo(thumbnailImageView.snp.height).multipliedBy(0.55)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(separator3View.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        bpmLabel.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(26)
            $0.leading.equalTo(infoLabel)
        }
        
        codeLabel.snp.makeConstraints {
            $0.top.equalTo(bpmLabel.snp.bottom).offset(27)
            $0.width.equalTo(56)
            $0.leading.equalTo(infoLabel)
        }
        
        instLabel.snp.makeConstraints {
            $0.top.equalTo(codeLabel.snp.bottom).offset(28)
            $0.leading.equalTo(codeLabel)
        }
        
        bpmTextFieldView.snp.makeConstraints {
            $0.leading.trailing.equalTo(codeTextFieldView)
            $0.centerY.equalTo(bpmLabel)
            $0.height.equalTo(bpmLabel)
        }
        
        codeTextFieldView.snp.makeConstraints {
            $0.leading.equalTo(codeLabel.snp.trailing).offset(36)
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(codeLabel)
            $0.height.equalTo(24)
        }
        
        instStackView.addArrangedSubviews(instTopStackView, instBottomStackView)
        instTopStackView.addArrangedSubviews(pianoButton, guitarButton, bassButton)
        instBottomStackView.addArrangedSubviews(drumButton, vocalButton, othersButton)
        instStackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(codeTextFieldView)
            $0.top.equalTo(instLabel)
        }
        
        separator4View.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(instStackView.snp.bottom).offset(26)
        }
        
        settingLabel.snp.makeConstraints {
            $0.top.equalTo(separator4View.snp.bottom).offset(20)
            $0.leading.equalTo(infoLabel)
        }
        publicSettingLabel.snp.makeConstraints {
            $0.top.equalTo(settingLabel.snp.bottom).offset(26)
            $0.leading.equalTo(infoLabel)
        }
        publicSettingSwitch.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(publicSettingLabel)
        }
        stackAllowLabel.snp.makeConstraints {
            $0.top.equalTo(publicSettingLabel.snp.bottom).offset(26)
            $0.leading.equalTo(infoLabel)
        }
        stackAllowSwitch.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(stackAllowLabel)
        }
        uploadButon.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-46)
        }
        tooltipView.snp.makeConstraints {
            $0.centerX.equalTo(uploadButon)
            $0.bottom.equalTo(uploadButon.snp.top).offset(-10)
            $0.width.equalTo(uploadButon).multipliedBy(1.2)
        }
        
        descriptionTextView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(descriptionCountLabel)
            $0.top.equalTo(separator2View).offset(22)
            $0.bottom.equalTo(descriptionCountLabel)
        }
        
        descriptionCountLabel.snp.makeConstraints {
            $0.trailing.equalTo(thumbnailImageView.snp.leading).offset(-24)
            $0.bottom.equalTo(separator3View).offset(-20)
        }
    }
}
