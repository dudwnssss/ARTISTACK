//
//  ProfileEditViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit
import RxSwift
import RxCocoa

class ProfileEditViewController: BaseViewController {
    
    let disposeBag = DisposeBag()
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
        }
        
        hideKeyboardWhenTappedAround()
    }
    
    override func bind() {
        let input = ProfileEditViewModel.Input(nickname: profileEditView.nicknameTextFieldView.textField.rx.text,
                                               description: profileEditView.descriptionTextView.textView.rx.text, tapCompleteButton: profileEditView.storeButton.rx.tap)
        let output = viewModel.transform(input: input)
        output.validation
            .withUnretained(self)
            .bind { vc, value in
                vc.profileEditView.storeButton.configureButton(isValid: value)
            }
            .disposed(by: disposeBag)
        
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
//        viewModel.updateProfile()
        navigationController?.popViewController(animated: true)
        passPop?()
    }
    
    override func loadView() {
        self.view = profileEditView
    }
}
