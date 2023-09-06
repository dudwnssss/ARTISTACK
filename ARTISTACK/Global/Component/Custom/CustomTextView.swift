//
//  CustomTextView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/31.
//

import UIKit

class CustomTextView: UIView{
    
    let textCountLabel = UILabel().then{
        $0.textColor = .artistackSystem4
        $0.font = .systemFont(ofSize: 14)
        $0.backgroundColor = .systemPink
    }
    
    let textView = UITextView().then{
        $0.isScrollEnabled = false
        $0.textColor = .white
        $0.textContainerInset = .zero
        $0.textContainer.lineFragmentPadding = 0
        $0.backgroundColor = .clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder: String, limitCount: Int, fontSize: CGFloat, isBold: Bool){
        self.init()
        textCountLabel.text = "\(limitCount)"
        textView.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize)
        setProperties()
        setLayouts()
    }
    
    func setProperties(){
    }
    
    func setLayouts(){
        addSubviews(textCountLabel, textView)
        textCountLabel.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview()
        }
        textView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(textCountLabel.snp.top)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        textCountLabel.snp.makeConstraints {
            $0.height.equalTo(18)
            $0.bottom.trailing.equalToSuperview()
        }
    }
    
}

