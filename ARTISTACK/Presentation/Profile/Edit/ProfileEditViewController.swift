//
//  ProfileEditViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit

class ProfileEditViewController: BaseViewController {
    
    let profileEditView =  ProfileEditView()
    let viewModel = ProfileEditViewModel()
    var passPop: (()->Void)?

    let barButtonItem = CustomBarButtonItem(isTitleWithBackButton: true).then{
        $0.titleLabel.text = "프로필 수정"
    }
    
    override func setNavigationBar(){
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)
    }
    
    override func setProperties() {
        profileEditView.do {
            $0.profileEditButton.addTarget(self, action: #selector(profileEditButtonDidTap), for: .touchUpInside)
            $0.storeButton.addTarget(self, action: #selector(storeButtonDidTap), for: .touchUpInside)
        }
        
        hideKeyboardWhenTappedAround()
    }
    
    override func bind() {
        viewModel.nicknameText.bind { [weak self] text in
            self?.profileEditView.nicknameTextFieldView.textField.text = text
        }
        viewModel.descriptionText.bind { [weak self] text in
            self?.profileEditView.descriptionTextView.textView.text = text
        }
        viewModel.profileData.bind { [weak self] data in
            self?.profileEditView.nicknameTextFieldView.textField.text = data?.nickname
            self?.profileEditView.descriptionTextView.textView.text = data?.description
        }
    }
    
    @objc func profileEditButtonDidTap(){
        let vc = EditProfileImageViewController()
        vc.normal = {
            self.profileEditView.profileImageView.profileImageView.image = Image.profileNormal
        }
        let bottomSheetViewController = BottomSheetViewController(type: .profileImage, contentViewController: vc)
        present(bottomSheetViewController, animated: true)
    }
    
    @objc func storeButtonDidTap(){
        viewModel.nicknameText.value = profileEditView.nicknameTextFieldView.textField.text
        viewModel.descriptionText.value = profileEditView.descriptionTextView.textView.text
        viewModel.updateProfile()
        navigationController?.popViewController(animated: true)
        passPop?()
    }
    
    override func loadView() {
        self.view = profileEditView
    }
}
