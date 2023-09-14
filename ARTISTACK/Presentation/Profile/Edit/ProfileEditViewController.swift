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
    
    @objc func profileEditButtonDidTap(){
        let bottomSheetViewController = BottomSheetViewController(isTouchPassable: false, contentViewController: ProfileImageViewController() as! ScrollableViewController)
        present(bottomSheetViewController, animated: true)
    }
    
    override func loadView() {
        self.view = profileEditView
    }
    
    
    override func setProperties() {
        profileEditView.do {
            $0.profileEditButton.addTarget(self, action: #selector(profileEditButtonDidTap), for: .touchUpInside)
        }

        hideKeyboardWhenTappedAround()
        setNavigationBar()
    }
}
