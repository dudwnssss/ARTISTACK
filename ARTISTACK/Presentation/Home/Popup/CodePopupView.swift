//
//  CodePopupView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class CodePopupView: BaseView{
        
    let darkBackgroundImageView = UIImageView().then{
        $0.image = Image.backgroundDarkTop
        $0.contentMode = .scaleAspectFill
    }
    
    let clearButton = UIButton()
    
    let titleLabel = UILabel().then{
        $0.text = "곡정보"
        $0.font = Font.bold18
    }
    let codeTitleLabel = UILabel().then{
        $0.text = "코드진행"
        $0.font = Font.bold22
    }
    let bpmTitleLabel = UILabel().then{
        $0.text = "BPM"
        $0.font = Font.bold22
    }
    let codeLabel = UILabel().then{
        $0.text = "C F Am Dm "
        $0.font = Font.medium22
    }
    let bpmLabel = UILabel().then{
        $0.text = "128"
        $0.font = Font.medium22
    }
    
    override func setLayouts() {
        addSubviews(darkBackgroundImageView, titleLabel, codeTitleLabel, codeLabel, bpmTitleLabel, bpmLabel, clearButton)
        darkBackgroundImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(-24)
        }
        codeTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(58)
        }
        codeLabel.snp.makeConstraints {
            $0.top.equalTo(codeTitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel)
        }
        
        bpmTitleLabel.snp.makeConstraints {
            $0.top.equalTo(codeLabel.snp.bottom).offset(24)
            $0.leading.equalTo(titleLabel)
        }
        bpmLabel.snp.makeConstraints {
            $0.top.equalTo(bpmTitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel)
        }
    }
}
