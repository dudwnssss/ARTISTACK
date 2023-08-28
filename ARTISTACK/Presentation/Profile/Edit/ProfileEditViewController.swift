//
//  ProfileEditViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit

class ProfileEditViewController: BaseViewController {
    
    let profileEditView =  ProfileEditView()
    
    override func loadView() {
        self.view = profileEditView
    }
    
    
    override func setProperties() {
        hideKeyboardWhenTappedAround()
    }
    
    
}
