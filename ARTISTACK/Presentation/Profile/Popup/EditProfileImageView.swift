//
//  ProfileImageView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/15.
//

import UIKit

class EditProfileImageView: BaseView {
    
    let albumButton = UIButton()
    let normalButton = UIButton()
    let separatorView = SeparatorView(isUnderLine: true)
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIScreen().bounds.width, height: UIScreen().bounds.height * 0.8)
    }
    
    override func setProperties() {
        invalidateIntrinsicContentSize()
        albumButton.do {
            $0.setTitle("앨범에서 선택", for: .normal)
            $0.setTitleColor(Color.white, for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 16)
            
            $0.backgroundColor = .systemPink
        }
        normalButton.do {
            $0.setTitle("기본이미지로 변경", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 16)

            $0.setTitleColor(Color.white, for: .normal)
        }
    }
    
    override func setLayouts() {
        addSubviews(albumButton, separatorView, normalButton)

        separatorView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        normalButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(separatorView.snp.bottom).offset(25)
        }
        albumButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(separatorView.snp.top).offset(-25)
        }
    }
    
    
}
