//
//  RecordView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class RecordView: BaseView {
    
  
    let timerButton = RecordUtilButton(utilType: .timer)
    let switchCameraButton = RecordUtilButton(utilType: .camera)
    
    let recordButton = UIButton().then{
        $0.setImage(UIImage(named: "record.start"), for: .normal)
    }
    let artistackOnLabel = UILabel().then{
        $0.text = "Artistack on"
        $0.font = .boldSystemFont(ofSize: 13)
    }
    let musicTitleLabel = UILabel().then{
        $0.text = "최대글자수입니다다다글자수입니다다다"
        $0.font = .systemFont(ofSize: 14)
    }
    let musicProgressView = MusicProgressView()
    
    override func setLayouts() {
    
        
        addSubviews(timerButton, switchCameraButton, recordButton, artistackOnLabel, musicTitleLabel, musicProgressView)
        recordButton.snp.makeConstraints {
            $0.size.equalTo(82)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-32)
        }
        timerButton.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-50)
            $0.trailing.equalToSuperview().offset(-4)
        }
        switchCameraButton.snp.makeConstraints {
            $0.centerX.equalTo(timerButton)
            $0.top.equalTo(timerButton.snp.bottom).offset(16)
        }
        artistackOnLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(56)
        }
        musicTitleLabel.snp.makeConstraints {
            $0.centerX.equalTo(artistackOnLabel)
            $0.top.equalTo(artistackOnLabel.snp.bottom).offset(3)
        }
        musicProgressView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(56)
        }
    }

}
