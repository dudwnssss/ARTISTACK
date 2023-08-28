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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .artistackBackground
        setLayouts()
        setProperties()
        print(#fileID, #function, #line, "- ")
    }
    
    func setLayouts(){}
    
    func setProperties(){}
    
}
