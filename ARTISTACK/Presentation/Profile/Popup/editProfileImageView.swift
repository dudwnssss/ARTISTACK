//
//  ProfileImageView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/15.
//

import UIKit

class EditProfileImageView: UIScrollView {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let albumButton = UIButton()
    let normalButton = UIButton()
    let separatorView = SeparatorView()
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIScreen().bounds.width, height: UIScreen().bounds.height * 0.4)
    }
    
    func setProperties() {
        albumButton.do {
            $0.setTitle("앨범에서 선택", for: .normal)
            $0.setTitleColor(.white, for: .normal)
        }
        normalButton.do {
            $0.setTitle("기본이미지로 변경", for: .normal)
            $0.setTitleColor(.white, for: .normal)
        }
    }
    
    func setLayouts() {
        addSubview(contentView)
        contentView.addSubviews(albumButton, separatorView, normalButton)
        separatorView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        normalButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(200)
            $0.top.equalTo(separatorView.snp.bottom).offset(25)
        }
        albumButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(200)
            $0.bottom.equalTo(separatorView.snp.top).offset(-25)
        }
    }
    
    
}
