//
//  CustomBarButtonItem.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class CustomBarButtonItem: BaseView {
        
    var isTitleWithBackButton : Bool = false
    
    init(isTitleWithBackButton: Bool = false) {
        self.isTitleWithBackButton = isTitleWithBackButton
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel = UILabel().then{
        $0.text = "temp3"
        $0.font = Font.bold18
    }

    override func setLayouts() {
        addSubview(titleLabel)
        switch isTitleWithBackButton{
        case true:
            titleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(-4)
                $0.centerY.equalToSuperview()
            }
        default:
            titleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(4)
                $0.centerY.equalToSuperview()
            }
        }
    }
}

