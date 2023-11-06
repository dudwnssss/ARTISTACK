//
//  ProfileEditViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit
import RxSwift
import RxCocoa

protocol ProfileEditProtocol: AnyObject {
    func profileDidEdit()
}

class ProfileEditViewController: BaseViewController {
    
    weak var delegate: ProfileEditProtocol?
    
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
        
        //Input
        profileEditView.nicknameTextFieldView.textField.rx.text
            .orEmpty
            .bind(to: viewModel.nickname)
            .disposed(by: disposeBag)
        
        profileEditView.descriptionTextView.textView.rx.text
            .orEmpty
            .bind(to: viewModel.description)
            .disposed(by: disposeBag)
        
        profileEditView.storeButton.rx.tap
            .bind(to: viewModel.tapCompleteButton)
            .disposed(by: disposeBag)
        
        //Output
        viewModel.validation
            .bind(with: self) { owner, value in
                owner.profileEditView.storeButton.isEnabled = value
                owner.profileEditView.storeButton.configureButton(isValid: value)
            }
            .disposed(by: disposeBag)
        
        viewModel.updateSuccess
            .bind(with: self) { owner, _ in
                owner.delegate?.profileDidEdit()
                owner.navigationController?.popViewController(animated: true)
            }
            .disposed(by: disposeBag)
        
        viewModel.nicknameOutput
            .bind(to: profileEditView.nicknameTextFieldView.textField.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.descriptionOutput
            .bind(to: profileEditView.descriptionTextView.textView.rx.text)
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
