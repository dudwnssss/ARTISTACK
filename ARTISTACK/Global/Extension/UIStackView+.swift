//
//  UIStackView+.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit.UIStackView

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
