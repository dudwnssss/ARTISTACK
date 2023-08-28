//
//  RecordViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/23.
//

import UIKit

class RecordViewController: BaseViewController {

    let dismissButton = UIButton().then{
        $0.setImage(UIImage(named: "dismiss"), for: .normal)
    }
    let timerButton = RecordUtilButton()
    let switchCameraButton = RecordUtilButton()
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
    
    @objc func dismissButtonDidTap(){
        dismiss(animated: true)
    }
    
    override func setProperties() {
        view.backgroundColor = .black
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTap), for: .touchUpInside)
    }
    
    override func setLayouts() {
        view.addSubviews(dismissButton, timerButton, switchCameraButton, recordButton, artistackOnLabel, musicTitleLabel)
        recordButton.snp.makeConstraints {
            $0.size.equalTo(82)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-32)
        }
        dismissButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.top.equalToSuperview().offset(36)
            $0.size.equalTo(44)
        }
        timerButton.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-50)
            $0.trailing.equalToSuperview().offset(-13)
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
    }

}


