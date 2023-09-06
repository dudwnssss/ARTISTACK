//
//  BaseView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
        setLayouts()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProperties(){}
    func setLayouts(){}
}
