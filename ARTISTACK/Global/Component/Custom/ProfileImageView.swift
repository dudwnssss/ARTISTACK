//
//  ProfileImageView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit

class ProfileImageView: UIView {
    
    let backgroundImageView = UIImageView().then{
        $0.image = Image.backgroundGradient
    }
    let profileImageView = UIImageView().then{
        $0.image = Image.profileNormal
        $0.backgroundColor = .red
        $0.clipsToBounds = true
    }
    let instImageView = UIImageView().then{
        $0.image = Image.piano
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
        setLayouts()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.addDiamondMask()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProperties(){
        
    }
    
    func setLayouts(){
        addSubviews(backgroundImageView, profileImageView)
        backgroundImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalToSuperview()
        }
        profileImageView.snp.makeConstraints {
            $0.center.equalTo(backgroundImageView)
            $0.size.equalTo(backgroundImageView).multipliedBy(0.9)
        }
    }
    
}
