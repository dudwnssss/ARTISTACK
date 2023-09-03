//
//  CustomBarButtonItem.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class CustomBarButtonItem: BaseView {
        
    var isTitleWithBackButton : Bool = false
    
    init(isTitleWithBackButton: Bool = false) {
        self.isTitleWithBackButton = isTitleWithBackButton
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel = UILabel().then{
        $0.text = "temp3"
        $0.font = .boldSystemFont(ofSize: 18)
    }

    override func setLayouts() {
        addSubview(titleLabel)
        switch isTitleWithBackButton{
        case true:
            titleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(-4)
                $0.centerY.equalToSuperview()
            }
        default:
            titleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(4)
                $0.centerY.equalToSuperview()
            }
        }
    }
}

#if DEBUG

import SwiftUI

struct CustomBarButtonItem_Previews: PreviewProvider {
    static var previews: some View {
        CustomBarButtonItem().getPreview()
            .previewLayout(.sizeThatFits)
    }
}

#endif
