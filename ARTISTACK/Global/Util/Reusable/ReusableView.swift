

import UIKit.UIView

protocol ReusableView: AnyObject {}

extension ReusableView where Self: UIView {
//    static var reuseIdentifier: String {
//        return String(describing: self)
//    }
    static var reuseIdentifier: String {
        return self.description()
    }
}
