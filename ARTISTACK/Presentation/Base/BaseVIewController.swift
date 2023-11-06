//
//  BaseVIewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit
import SnapKit
import Then

class BaseViewController: UIViewController {
    
    init(){
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = Color.artistackSystem1
        setProperties()
        setLayouts()
        setNavigationBar()
        bind()
    }
    
    func setProperties(){}
    func setLayouts(){}
    func setNavigationBar(){}
    func bind(){}
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
