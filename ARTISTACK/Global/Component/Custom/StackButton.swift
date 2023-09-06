//
//  StackButton.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/06.
//

import UIKit

enum StackType{
    case first
    case stack
    
    var buttonImage: UIImage{
        switch self {
        case .first:
            return UIImage(named: "record.first")!
        case .stack:
            return UIImage(named: "record")!
        }
    }
}

class StackButton: UIButton{
    static let shared = StackButton()
    
    var stackType: StackType = .stack
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
    }
    
    func setProperties(){
        print(#fileID, #function, #line, "- ")
        print(stackType.buttonImage)
        setImage(stackType.buttonImage, for: .normal)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
