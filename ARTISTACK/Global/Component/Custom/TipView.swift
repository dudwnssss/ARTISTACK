//
//  ToolTipView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit

enum TipPosition {
    case top
    case bottom
}

final class TipView: UIView {
    
    var tipPosition = TipPosition.bottom

    var bgColor = UIColor.systemIndigo
    
    override func draw(_ rect: CGRect) {
        backgroundColor = .clear
        bgColor.setFill()
        switch tipPosition {
        case .top:
            drawTopTip(rect)
        case .bottom:
            drawBottomTip(rect)
        }
    }
    
    private func drawTopTip(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.midX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.close()
        path.fill()
    }
    
    private func drawBottomTip(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.close()
        path.fill()
    }
    
}
