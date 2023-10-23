//
//  SeparatorView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/24.
//

import UIKit

class SeparatorView: BaseView {
    
    var inset: Int?
    
    let separatorView = UIView()
        
    init(isUnderLine: Bool = false, inset: Int? = nil){
        self.inset = inset
        separatorView.backgroundColor = isUnderLine ? Color.artistackSystem3 : Color.artistackSystem2
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setProperties() {
        separatorView.backgroundColor = Color.artistackSystem2
    }
    
    override func setLayouts(){
        addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(inset ?? 0)
            $0.height.equalTo(1)
        }
    }
    
    
}


//import UIKit
//
//class SeparatorView: BaseView {
//
//    var inset: Int?
//
//    convenience init( isUnderLine: Bool = false, inset: Int? = nil){
//        self.init()
//        self.inset = inset
//        backgroundColor = isUnderLine ? .artistackSystem3 : .artistackSystem2
//        setLayouts()
//    }
//
//    override func setLayouts(){
//        snp.makeConstraints {
////            $0.verticalEdges.equalToSuperview()
////            $0.horizontalEdges.equalToSuperview().inset(inset ?? 0)
//            $0.height.equalTo(1)
//        }
//    }
//}
