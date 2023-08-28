//
//  File.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class CheckRecordView: BaseView {
    
    let dismissButton = UIButton().then{
        $0.setImage(UIImage(named: "dismiss"), for: .normal)
    }
    let volumeButton = RecordUtilButton(utilType: .volume)
    let retakeButton = RecordUtilButton(utilType: .retake)
    let replayButton = RecordUtilButton(utilType: .replay)
    let completeButton = CompleteButton().then{
        $0.backgroundImageView.layer.cornerRadius = 22
        $0.backgroundImageView.clipsToBounds = true
        $0.buttonTitleLabel.text = "완료"
    }
    
    override func setLayouts() {
        addSubviews(dismissButton, volumeButton, retakeButton, replayButton, completeButton)
        dismissButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.top.equalToSuperview().offset(36)
            $0.size.equalTo(44)
        }
        volumeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-20)
            $0.trailing.equalToSuperview().offset(-4)
        }
        retakeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-38)
        }
        replayButton.snp.makeConstraints {
            $0.centerY.equalTo(retakeButton)
            $0.leading.equalTo(retakeButton.snp.trailing).offset(12)
        }
        completeButton.snp.makeConstraints {
            $0.width.equalTo(88)
            $0.trailing.equalToSuperview().offset(-30)
            $0.centerY.equalTo(retakeButton)
        }
    }
}
