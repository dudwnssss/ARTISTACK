//
//  File.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class CheckRecordView: BaseView {
    
    let volumeButton = RecordUtilButton(utilType: .volume)
    let retakeButton = RecordUtilButton(utilType: .retake)
    let replayButton = RecordUtilButton(utilType: .replay)
    let completeButton = CompleteButton(title: "완료").then{
        $0.backgroundImageView.layer.cornerRadius = 22
        $0.backgroundImageView.clipsToBounds = true
    }
    
    override func setLayouts() {
        addSubviews( volumeButton, retakeButton, replayButton, completeButton)

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
