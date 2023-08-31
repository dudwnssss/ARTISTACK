//
//  infoTextField.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/27.
//

import UIKit

class CustomTextFieldView : BaseView{
    
    let underLineView = SeparatorView(isUnderLine: true)
    let textCountLabel = UILabel().then{
        $0.text = "26"
        $0.textColor = .artistackSystem4
        $0.font = .systemFont(ofSize: 14)
    }
    let textField = UITextField().then{
        $0.textColor = .white
    }
    
    convenience init(placeholder: String, limitCount: Int, isUnderLined: Bool = false, fontSize: CGFloat = 16, isBold: Bool = false) {
        self.init(frame: .zero)
        textField.font = isBold ? .boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize)
        textField.attributedPlaceholder =  NSAttributedString(string: placeholder, attributes: [.foregroundColor : UIColor.artistackSystem3!, .font : UIFont.systemFont(ofSize: fontSize)])
        underLineView.isHidden = !isUnderLined
        textCountLabel.text = "\(limitCount)"
        setProperties()
        setLayouts()
    }
    

    
    override func setProperties(){
//        textField.delegate = self
    }
    
    override func setLayouts(){
        addSubviews(underLineView, textCountLabel, textField)
        underLineView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        textCountLabel.snp.makeConstraints {
            $0.width.equalTo(20)
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(underLineView.snp.top).offset(-8)
        }
        
        textField.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(textCountLabel.snp.leading).offset(-4)
            $0.top.equalToSuperview()
        }
    }
}

//extension CustomTextFieldView: UITextFieldDelegate{
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        var length = textField.text?.count
//        print(length)
//        return true
//    }
//}
