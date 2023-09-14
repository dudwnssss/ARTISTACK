//
//  ProfileImageViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/14.
//

import UIKit

enum EditType{
    case album
    case normal
    
    var title: String {
        switch self {
        case .album:
            return "앨범에서 선택"
        case .normal:
            return "기본 이미지로 변경"
        }
    }
}

class ProfileImageViewController: BaseViewController, ScrollableViewController{
    
    var scrollView: UIScrollView{
        return UIScrollView()
    }
    
    let albumButton = UIButton()
    let normalButton = UIButton()
    let separatorView = SeparatorView()
    
    override func setProperties() {
        albumButton.do {
            $0.setTitle("앨범에서 선택", for: .normal)
            $0.setTitleColor(.white, for: .normal)
        }
        normalButton.do {
            $0.setTitle("기본이미지로 변경", for: .normal)
            $0.setTitleColor(.white, for: .normal)
        }
    }
    
    override func setLayouts() {
        view.addSubviews(albumButton, separatorView, normalButton)
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
