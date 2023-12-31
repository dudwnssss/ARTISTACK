//
//  CustomTextView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/31.
//

import UIKit
import SnapKit

class CustomTextView: UIView {
    
    var placeholder: String?
    var limitCount: Int = 0 {
        didSet {
            updateCountLabel()
        }
    }
    
    let textView = UITextView()
    let textCountLabel = UILabel()
    
    
    init(placeholder: String, limitCount: Int, fontSize: CGFloat, isBold: Bool) {
        self.placeholder = placeholder
        self.limitCount = limitCount
        super.init(frame: .zero)
        textCountLabel.text = "\(limitCount)"
        textView.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize)
        setProperties()
        setLayouts()
    }
    
    private func setPlaceholder() {
        if textView.text.isEmpty {
            if let placeholderText = placeholder {
                print("아 나 호출됨")
                textView.text = placeholderText
                textView.textColor = Color.artistackSystem3
            }
        }
    }
    
    func setProperties() {
        textView.do {
            $0.textColor = Color.white
            $0.delegate = self
            $0.isScrollEnabled = false
            $0.textContainerInset = .zero
            $0.textContainer.lineFragmentPadding = 0
            $0.backgroundColor = .clear
        }
        textCountLabel.do {
            $0.textColor = Color.artistackSystem4
            $0.textAlignment = .right
            $0.font = .systemFont(ofSize: 14)
        }
        setPlaceholder()
    }
    
    func setLayouts() {
        addSubviews(textCountLabel, textView)
        textCountLabel.snp.makeConstraints {
            $0.height.equalTo(18)
            $0.bottom.trailing.equalToSuperview()
        }
        textView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(textCountLabel.snp.top)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTextView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if let text = textView.text, text.count > limitCount {
            let index = text.index(text.startIndex, offsetBy: limitCount)
            textView.text = String(text.prefix(upTo: index))
        }
        updateCountLabel()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == Color.artistackSystem3 {
            textView.text = nil
            textView.textColor = Color.white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            setPlaceholder()
        }
    }
    
    func updateCountLabel() {
        let remainingCount = limitCount - (textView.text?.count ?? 0)
        textCountLabel.text = "\(remainingCount)"
    }
}
