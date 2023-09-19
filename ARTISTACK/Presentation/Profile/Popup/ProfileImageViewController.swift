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
    
    let editProfileView = EditProfileImageView()
    
    var scrollView: UIScrollView{
        editProfileView
    }
    
    override func setLayouts() {
        view.addSubview(editProfileView)
        editProfileView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
