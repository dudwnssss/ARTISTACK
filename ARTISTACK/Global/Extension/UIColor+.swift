//
//  UIColor+.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit.UIColor

extension UIColor {
    
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        var hexWithoutSymbol = hex
        if hexWithoutSymbol.hasPrefix("#") {
            hexWithoutSymbol = String(hexWithoutSymbol.dropFirst())
        }

        guard hexWithoutSymbol.count == 6 else {
            return nil
        }

        var rgb: UInt64 = 0
        Scanner(string: hexWithoutSymbol).scanHexInt64(&rgb)

        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    static let artistackSystem1 = UIColor(hex: "#0F1627")
    static let artistackSystem2 = UIColor(hex: "#262F44")
    static let artistackSystem3 = UIColor(hex: "#505970")
    static let artistackSystem4 = UIColor(hex: "#6B7795")
    static let artistackSystem5 = UIColor(hex: "#78839E")
    static let artistackSystem6 = UIColor(hex: "#A5B0CC")
    static let artistackSystem10 = UIColor(hex: "#DEE0E7")

    static let artistackPurple = UIColor(hex: "#6036F2")
    static let artistackPink = UIColor(hex: "#A83A99")


}
