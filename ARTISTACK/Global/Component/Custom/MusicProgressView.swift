//
//  TimerView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class MusicProgressView: BaseView {
    let progressTimeLabel = UILabel().then{
        $0.font = .boldSystemFont(ofSize: 16)
        $0.text = "00:54"
    }
    let totalTimeLabel = UILabel().then{
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = .lightGray
        $0.text = "01:24"
    }
    let separatorView = UIView().then{
        $0.backgroundColor = .lightGray
    }
    
    override func setProperties() {
        layer.cornerRadius = 15
        layer.backgroundColor = UIColor(white: 1, alpha: 0.3).cgColor
    }
    
    override func setLayouts() {
        addSubviews(progressTimeLabel, totalTimeLabel, separatorView)
        separatorView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        progressTimeLabel.snp.makeConstraints {
            $0.trailing.equalTo(separatorView).offset(-8)
            $0.centerY.equalToSuperview()
        }
        totalTimeLabel.snp.makeConstraints {
            $0.leading.equalTo(separatorView).offset(8)
            $0.centerY.equalToSuperview()
        }
        snp.makeConstraints {
            $0.width.equalTo(148)
            $0.height.equalTo(30)
        }
    }
}
