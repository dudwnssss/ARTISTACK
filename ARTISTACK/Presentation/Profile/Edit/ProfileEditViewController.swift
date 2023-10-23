//
//  ProfileEditViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit

class ProfileEditViewController: BaseViewController {
    
    let profileEditView =  ProfileEditView()
    let profileEditViewModel = ProfileEditViewModel()
    
    let barButtonItem = CustomBarButtonItem(isTitleWithBackButton: true).then{
        $0.titleLabel.text = "프로필 수정"
    }
    
    func setNavigationBar(){
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)
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
        let nickname = profileEditView.nicknameTextFieldView.textField.text ?? ""
        let description = profileEditView.descriptionTextView.textView.text ?? ""
        let request = EditProfileRequest(nickname: nickname,description: description)
        Network.shared.request(type: UserData.self, api: UsersTarget.editProfile(request)) { response in
            switch response{
            case .success(let success):
                debugPrint(response)
            case .failure(_):
                debugPrint(response)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func loadView() {
        self.view = profileEditView
    }
    
    
    override func setProperties() {
        profileEditView.do {
            $0.profileEditButton.addTarget(self, action: #selector(profileEditButtonDidTap), for: .touchUpInside)
            $0.storeButton.addTarget(self, action: #selector(storeButtonDidTap), for: .touchUpInside)
        }

        hideKeyboardWhenTappedAround()
        setNavigationBar()
    }
    
//    override func bind() {
//        if let nickname = profileEditView.nicknameTextFieldView.textField.text{
//            profileEditViewModel.nicknameText.value = nickname
//        }
//        if let description = profileEditView.descriptionTextView.textView.text{
//            profileEditViewModel.descriptionText.value = description
//        }
//    }
}
