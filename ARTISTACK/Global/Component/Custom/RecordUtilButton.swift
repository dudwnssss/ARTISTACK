//
//  recordUtilButton.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class RecordUtilButton: UIButton {
    
    let utilTitleLabel = UILabel().then{
        $0.text = "temp"
        $0.font = .boldSystemFont(ofSize: 11)
    }
    let utilImageView = UIImageView().then{
        $0.backgroundColor = .blue
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayouts(){
        addSubviews(utilImageView, utilTitleLabel)
        snp.makeConstraints {
            $0.width.equalTo(52)
            $0.height.equalTo(60)
        }
        utilTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        utilImageView.snp.makeConstraints {
            $0.size.equalTo(42)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(utilTitleLabel).offset(-2)
        }
    }
}
