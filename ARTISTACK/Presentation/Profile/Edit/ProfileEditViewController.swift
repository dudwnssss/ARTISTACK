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
        viewModel.profileData.bind { [weak self] data in
            self?.profileEditView.nicknameTextFieldView.textField.text = data?.nickname
            self?.profileEditView.descriptionTextView.textView.text = data?.description
        }
        profileEditView.nicknameTextFieldView.textField.rx.text.orEmpty
            .bind(to: viewModel.input.nickname)
            .disposed(by: disposeBag)
        
        profileEditView.descriptionTextView.textView.rx.text
            .orEmpty
            .bind(to: viewModel.input.description)
            .disposed(by: disposeBag)
        
        profileEditView.storeButton.rx.tap
            .bind { [weak self] _ in
                print("버튼터치됨")
            }.disposed(by: disposeBag)
        
        viewModel.output.userDataFinishedTrigger
            .bind { <#()#> in
                <#code#>
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
        viewModel.updateProfile()
        navigationController?.popViewController(animated: true)
        passPop?()
    }
    
    override func loadView() {
        self.view = profileEditView
    }
}
