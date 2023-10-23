//
//  CodePopupViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/24.
//

import UIKit

class CodePopupViewController: BaseViewController {
    
    let codePopupView = CodePopupView()
    
    override func loadView() {
        self.view = codePopupView
    }
    
    override func setProperties() {
        view.backgroundColor = Color.white
    }
    
    
    
}

