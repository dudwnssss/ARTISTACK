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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .artistackSystem1
        setProperties()
        setLayouts()
        bind()
    }
    
    func setProperties(){}
    func setLayouts(){}
    func bind(){}
}
