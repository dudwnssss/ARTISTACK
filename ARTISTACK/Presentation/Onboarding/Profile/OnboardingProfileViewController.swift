//
//  OnboardingProfileViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import UIKit

class OnboardingProfileViewController : BaseViewController{
    
    let onboardingProfileView = OnboardingProfileView()
    override func loadView() {
        self.view = onboardingProfileView
    }
    
    
    var placeholder: String? = "어떤 음악을 하시는지 소개해주세요!\nEx) 기타와 피아노치는것을 좋아합니다."{
        didSet {
            setPlaceholder()
        }
    }
    
    var limitCount: Int = 38 {
        didSet {
            updateCountLabel()
        }
    }
    
    override func setProperties() {
        hideKeyboardWhenTappedAround()
        onboardingProfileView.textView.delegate = self
        setPlaceholder()
        onboardingProfileView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    private func setPlaceholder() {
        if let placeholderText = placeholder {
            onboardingProfileView.textView.text = placeholderText
            onboardingProfileView.textView.textColor = .artistackSystem4
            onboardingProfileView.textView.font = .systemFont(ofSize: 18)
        }
    }
    
    @objc func nextButtonDidTap(){
        let vc = OnboardingAgreementViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension OnboardingProfileViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        if textView.text == placeholder {
            textView.text = ""
            textView.textColor = .white
            textView.font = .systemFont(ofSize: 18)
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
            textView.textColor = .white
            textView.font = .systemFont(ofSize: 18)
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
