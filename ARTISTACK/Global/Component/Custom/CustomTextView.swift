//
//  CustomTextView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/31.
//

import UIKit

class CustomTextView: UITextView{
    
    let textCountLabel = UILabel().then{
        $0.textColor = .artistackSystem4
        $0.font = .systemFont(ofSize: 14)
        $0.backgroundColor = .systemPink
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder: String, limitCount: Int, fontSize: CGFloat, isBold: Bool){
        self.init()
        textCountLabel.text = "\(limitCount)"
        font = isBold ? .boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize)
        setProperties()
        setLayouts()
    }
    
    func setProperties(){
        isScrollEnabled = false
        textColor = .white
//        backgroundColor = .clear
        
        
        textContainerInset = .zero
        textContainer.lineFragmentPadding = 0
    }
    
    func setLayouts(){
        addSubview(textCountLabel)
        textCountLabel.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview()
            $0.width.equalTo(20)
        }
    }
    
}

