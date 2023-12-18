//
//  ProfileEditViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit
import RxSwift
import RxCocoa

protocol ProfileEditDelegate: AnyObject {
    func profileDidEdit(userData: UserData)
}

class ProfileEditViewController: BaseViewController {
    
    private let profileEditView = ProfileEditView()
    private let viewModel: ProfileEditViewModel
    private let disposeBag = DisposeBag()
    weak var delegate: ProfileEditDelegate?
    
    init(viewModel: ProfileEditViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func loadView() {
        self.view = profileEditView
    }
    
    override func setNavigationBar() {
        navigationItem.leftItemsSupplementBackButton = true
        let barButtonItem = CustomBarButtonItem(isTitleWithBackButton: true)
        barButtonItem.titleLabel.text = "프로필 수정"
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)
    }
    
    override func bind() {
        let input = ProfileEditViewModel.Input(nickname: profileEditView.nicknameTextFieldView.textField.rx.text.orEmpty.asObservable(),
                                               description: profileEditView.descriptionTextView.textView.rx.text.orEmpty.asObservable(),
                                               storeButtonDidTap: profileEditView.storeButton.rx.tap.asObservable())
        let output = viewModel.transform(input: input)
        
        output.nickname
            .debug()
            .bind(to: profileEditView.nicknameTextFieldView.textField.rx.text)
            .disposed(by: disposeBag)
        
        output.description
            .debug()
            .bind(to: profileEditView.descriptionTextView.textView.rx.text)
            .disposed(by: disposeBag)
        
        output.editComplete
            .bind(with: self) { owner, data in
                owner.delegate?.profileDidEdit(userData: data)
                owner.navigationController?.popViewController(animated: true)
            }
            .disposed(by: disposeBag)
        
    }
    
    override func setProperties() {
        hideKeyboardWhenTappedAround()
    }
}
