//
//  popupContentView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/25.
//

import UIKit
import SnapKit

class popupContentButton: UIButton {
    
    let popupTitleLabel = UILabel().then{
        $0.font = Font.medium15
    }
    let iconImageView = UIImageView().then{
        $0.contentMode = .scaleAspectFill
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayouts()
    }
    
    func setLayouts(){
        addSubviews(popupTitleLabel, iconImageView)
        popupTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.centerY.equalToSuperview()
        }
        iconImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-8)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(30)
        }
       snp.makeConstraints {
           $0.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

