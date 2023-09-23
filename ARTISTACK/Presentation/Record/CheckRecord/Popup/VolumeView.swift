//
//  VolumeView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/22.
//

import UIKit

class VolumeView : BaseView {
    
    let headerLabel = UILabel()
    let completeButton = CompleteButton(title: "적용")
    let originalSoundLabel = UILabel()
    let addedSoundLabel = UILabel()
    let originalSoundSlider = CustomSlider()
    let addedSoundSlider = CustomSlider()
    
    override func setProperties() {
        completeButton.do {
            $0.backgroundImageView.layer.cornerRadius = 22
            $0.backgroundImageView.clipsToBounds = true
        }

        headerLabel.do {
            $0.text = "볼륨 조절"
            $0.font = .boldSystemFont(ofSize: 16)
        }
        originalSoundLabel.do {
            $0.text = "오리지널 사운드"
            $0.font = .boldSystemFont(ofSize: 16)
            $0.textColor = .artistackSystem5
        }
        addedSoundLabel.do {
            $0.text = "추가된 사운드"
            $0.font = .boldSystemFont(ofSize: 16)
            $0.textColor = .artistackSystem5
        }
    }
    
    override func setLayouts() {
        addSubviews(headerLabel, completeButton, originalSoundLabel, addedSoundLabel, originalSoundSlider, addedSoundSlider)
        completeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(88)
            $0.bottom.equalToSuperview().offset(-42)
        }
        addedSoundSlider.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(completeButton.snp.top).offset(-36)
        }
        addedSoundLabel.snp.makeConstraints {
            $0.bottom.equalTo(addedSoundSlider.snp.top).offset(-16)
            $0.leading.equalTo(addedSoundSlider)
        }
        originalSoundSlider.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(addedSoundLabel.snp.top).offset(-36)
        }
        originalSoundLabel.snp.makeConstraints {
            $0.bottom.equalTo(originalSoundSlider.snp.top).offset(-16)
            $0.leading.equalTo(addedSoundSlider)
        }
        headerLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(36)
            $0.leading.equalTo(addedSoundSlider)
        }
    }
}
