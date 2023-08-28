//
//  SeparatorView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/24.
//

import UIKit

class SeparatorView: UIView {
    
    var inset: Int?
    
    let separatorView = UIView().then{
        $0.backgroundColor = .lightGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayouts()
    }
    
    convenience init(inset: Int){
        self.init(frame: .zero)
        self.inset = inset
        setLayouts()
    }
    
    func setLayouts(){
        addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(inset ?? 0)
            $0.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


