//
//  File.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit

final class UserCell: UITableViewCell {
    
    let backgroundImageView = UIImageView().then{
        $0.image = UIImage(named: "background.gradient")
    }
    let profileImageView = UIImageView().then{
        $0.backgroundColor = .systemMint
        $0.image = UIImage(named: "person")
    }
    let instImageView = UIImageView().then{
        $0.image = UIImage(named: "piano")
    }
    let nicknameLabel = UILabel().then{
        $0.text = "musician_abc"
        $0.font = Font.bold16
    }
    let lineImageView = UIImageView().then{
        $0.image = UIImage(named: "line")
//        $0.backgroundColor = .brown
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayouts()
        setProperties()
    }
    
    override func layoutIfNeeded() { //??
        super.layoutIfNeeded()
        profileImageView.addDiamondMask()

    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayouts(){
        contentView.addSubviews(backgroundImageView, profileImageView, instImageView, nicknameLabel, lineImageView)
        
        backgroundImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(48)
        }
        
        profileImageView.snp.makeConstraints {
            $0.center.equalTo(backgroundImageView)
            $0.size.equalTo(backgroundImageView).multipliedBy(0.85)
        }
        
        instImageView.snp.makeConstraints {
            $0.size.equalTo(30)
            $0.leading.equalTo(backgroundImageView.snp.centerX)
            $0.bottom.equalTo(backgroundImageView.snp.bottom)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.leading.equalTo(backgroundImageView.snp.trailing).offset(10)
            $0.centerY.equalTo(backgroundImageView)
        }
        
        lineImageView.snp.makeConstraints {
            $0.centerX.equalTo(backgroundImageView)
            $0.bottom.equalTo(backgroundImageView.snp.top)
            $0.top.equalToSuperview()
        }
    }
    
    func setProperties(){
        self.backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
}

