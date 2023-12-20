//
//  OnboardingProfileViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import UIKit
import PhotosUI

import RxSwift
import RxCocoa

class OnboardingProfileViewController : BaseViewController{
    private let onboardingProfileView = OnboardingProfileView()
    private let viewModel = OnboardingProfileViewModel()
    private let disposeBag = DisposeBag()
    private let setProfileImageTrigger = PublishRelay<Data>()
    
    override func loadView() {
        self.view = onboardingProfileView
    }
    
    
    var placeholder: String? = Const.profileDescription{
        didSet {
            setPlaceholder()
        }
    }
    
    var limitCount: Int = 38 {
        didSet {
            updateCountLabel()
        }
    }
    
    override func bind() {
        let input = OnboardingProfileViewModel.Input(profileImageDidSet: setProfileImageTrigger.asObservable(),
                                                     nextButtonDidTap: onboardingProfileView.nextButton.rx.tap.asObservable(),
                                                     description: onboardingProfileView.textView.rx.text.orEmpty.asObservable())
        
        let output = viewModel.transform(input: input)
        
        onboardingProfileView.profileButton.rx.tap
            .asDriver()
            .drive(with: self) { owner, _ in
                owner.presentPickerView()
            }
            .disposed(by: disposeBag)
        
        output.pushToNextVC
            .bind(with: self) { owner, _ in
                owner.navigateToAgreementVC()
            }
            .disposed(by: disposeBag)
    }
    
    override func setProperties() {
        hideKeyboardWhenTappedAround()
        onboardingProfileView.textView.delegate = self
        setPlaceholder()
    }
    
    private func setPlaceholder() {
        if let placeholderText = placeholder {
            onboardingProfileView.textView.text = placeholderText
            onboardingProfileView.textView.textColor = Color.artistackSystem4
            onboardingProfileView.textView.font = Font.medium18
        }
    }
    
    func presentPickerView(){
        var configuration = PHPickerConfiguration()
        configuration.filter = .any(of: [.images])
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func navigateToAgreementVC(){
        let vc = OnboardingAgreementViewController()
        vc.modalTransitionStyle = .crossDissolve
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension OnboardingProfileViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        if textView.text == placeholder {
            textView.text = ""
            textView.textColor = Color.white
            textView.font = Font.medium18
        }
        
        if let text = textView.text, text.count > limitCount {
            let index = text.index(text.startIndex, offsetBy: limitCount)
            textView.text = String(text.prefix(upTo: index))
        }
        updateCountLabel()
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView.text == placeholder {
            textView.text = ""
            textView.textColor = Color.white
            textView.font = Font.medium18
        }
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        if textView.text.isEmpty {
            setPlaceholder()
        }
        return true
    }
    
    
    func updateCountLabel() {
        let remainingCount = limitCount - (onboardingProfileView.textView.text?.count ?? 0)
            onboardingProfileView.textCountLabel.text = "\(remainingCount)"
    }
}

extension OnboardingProfileViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        let itemProvider = results.first?.itemProvider
        if let itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) {[weak self] image, error in
                if let image = image as? UIImage {
                    DispatchQueue.main.async {
                        self?.onboardingProfileView.configureProfileImage(image: image)
                        self?.setProfileImageTrigger.accept(image.pngData() ?? Data())
                        self?.dismiss(animated: true)
                    }
                }
            }
        }
    }
}
