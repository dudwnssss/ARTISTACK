//
//  UILabel+.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/30.
//

import UIKit.UILabel

enum TitleType {
    case main
    case sub
}

extension UILabel{
    
    func configureTitle(title: String, titleType: TitleType){
        switch titleType {
        case .main:
            textColor = Color.artistackSystem10
        
        case .sub:
            textColor = Color.artistackSystem5
        }
        text = title
        font = .boldSystemFont(ofSize: 16)
    }
}

