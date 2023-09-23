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
    let titleTextFieldView = CustomTextFieldView(placeholder: "프로젝트 제목을 입력해주세요", limitCount: 18)
    
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
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 3
        $0.clipsToBounds = true
    }
    
    let separator3View = SeparatorView()

    let infoLabel = UILabel().then{
        $0.configureTitle(title: "곡정보", titleType: .main)
    }
    
    let bpmLabel = UILabel().then{
        $0.configureTitle(title: "BPM", titleType: .sub)
    }
    
    
    let bpmTextFieldView = CustomTextFieldView(placeholder: "Ex) 123", limitCount: 26, isUnderLined: true)
    
    let codeLabel = UILabel().then{
        $0.configureTitle(title: "코드진행", titleType: .sub)
    }
    
    let codeTextFieldView = CustomTextFieldView(placeholder: "Ex) C F Am Dm", limitCount: 26, isUnderLined: true)
    
    let instLabel = UILabel().then{
        $0.configureTitle(title: "악기선택", titleType: .sub)
    }
    
    let pianoButton = InstButton(type: .piano)
    let guitarButton = InstButton(type: .guitar)
    let bassButton = InstButton(type: .bass)
    let drumButton = InstButton(type: .drum)
    let vocalButton = InstButton(type: .vocal)
    let othersButton = InstButton(type: .others)
    
    let separator4View = SeparatorView()
    
    let settingLabel = UILabel().then{
        $0.configureTitle(title: "설정", titleType: .main)
    }
    
    let publicSettingLabel =  UILabel().then{
        $0.configureTitle(title: "공개 설정", titleType: .sub)
    }
    
    let publicSettingSwitch = UISwitch().then{
        $0.isOn = true
        $0.onTintColor = .artistackPurple
    }
    
    let stackAllowLabel = UILabel().then{
        $0.configureTitle(title: "스택 허용", titleType: .sub)
    }

    let stackAllowSwitch = UISwitch().then{
        $0.isOn = true
        $0.onTintColor = .artistackPurple
    }
    
    let uploadButon = CompleteButton(title: "게시하기")
    
    let instTopStackView = UIStackView().then{
        $0.distribution = .fillEqually
        $0.spacing = 8
        $0.axis = .horizontal
    }
    let instBottomStackView = UIStackView().then{
        $0.distribution = .fillEqually
        $0.spacing = 8
        $0.axis = .horizontal
    }
    let instStackView = UIStackView().then{
        $0.distribution = .fill
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
        contentView.addSubviews(separator1View, titleTextFieldView, separator2View, descriptionTextView, descriptionCountLabel, thumbnailImageView, separator3View, infoLabel, bpmLabel, bpmTextFieldView, codeLabel, codeTextFieldView, instLabel, instStackView, separator4View, settingLabel, publicSettingLabel, publicSettingSwitch, stackAllowLabel, stackAllowSwitch)
        
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
            $0.top.equalTo(bpmLabel)
            $0.height.equalTo(28)
        }
        
        codeTextFieldView.snp.makeConstraints {
            $0.leading.equalTo(codeLabel.snp.trailing).offset(36)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(codeLabel)
            $0.height.equalTo(28)
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
