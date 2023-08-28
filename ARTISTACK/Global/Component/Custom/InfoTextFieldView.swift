//
//  infoTextField.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/27.
//

import UIKit

class InfoTextFieldView : UIView{
    
    let underLineView = SeparatorView()
    let textCountLabel = UILabel().then{
        $0.text = "26"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 14)
    }
    let infoTextField = UITextField().then{
        $0.font = .boldSystemFont(ofSize: 15)
        $0.textColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProperties(){
    }
    
    func setLayouts(){
        addSubviews(underLineView, textCountLabel, infoTextField)
        underLineView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        textCountLabel.snp.makeConstraints {
            $0.width.equalTo(20)
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(underLineView.snp.top).offset(-8)
        }
        
        infoTextField.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(textCountLabel.snp.leading).offset(-4)
            $0.centerY.equalTo(textCountLabel)
        }

        
        
    }
    
    
}
