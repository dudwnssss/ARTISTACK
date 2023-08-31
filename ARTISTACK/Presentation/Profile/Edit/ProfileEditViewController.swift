//
//  ProfileEditViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit

class ProfileEditViewController: BaseViewController {
    
    let profileEditView =  ProfileEditView()
    let barButtonItem = CustomBarButtonItem(isTitleWithBackButton: true).then{
        $0.titleLabel.text = "프로필 수정"
    }
    
    func setNavigationBar(){
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)
    }
    
    override func loadView() {
        self.view = profileEditView
    }
    
    
    override func setProperties() {
        hideKeyboardWhenTappedAround()
        setNavigationBar()
    }
}
