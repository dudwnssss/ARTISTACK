//
//  customButton.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit

class CompleteButton: UIButton {
    
    let backgroundImageView = UIImageView().then{
        $0.image = UIImage(named: "button.background.activated")
    }
    
    let buttonTitleLabel = UILabel().then{
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayouts()
    }
    
    func setLayouts(){
        addSubviews(backgroundImageView, buttonTitleLabel)
        backgroundImageView.snp.makeConstraints {
            $0.size.equalToSuperview()
            $0.center.equalToSuperview()
        }
        buttonTitleLabel.snp.makeConstraints {
            $0.center.equalTo(backgroundImageView)
        }
        snp.makeConstraints {
            $0.height.equalTo(44)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
