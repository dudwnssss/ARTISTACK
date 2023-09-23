//
//  UIVIew+.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit.UIView

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }

    func addDiamondMask(cornerRadius: CGFloat = 0) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.midX, y: bounds.minY + cornerRadius))
        path.addLine(to: CGPoint(x: bounds.maxX - cornerRadius, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.midX, y: bounds.maxY - cornerRadius))
        path.addLine(to: CGPoint(x: bounds.minX + cornerRadius, y: bounds.midY))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = cornerRadius * 2
        shapeLayer.lineJoin = .round
        shapeLayer.lineCap = .round
        
        layer.mask = shapeLayer
    }
    
    func addGradient(
        colors: [UIColor],
        startPoint: CGPoint? = CGPoint(x: 0.5, y: 0.0),
        endPoint: CGPoint? = CGPoint(x: 0.5, y: 1.0)
    ) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint ?? CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = endPoint ?? CGPoint(x: 0.5, y: 0.7)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    var snapshot: UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        let capturedImage = renderer.image { context in
            layer.render(in: context.cgContext)
        }
        return capturedImage
    }
}

#if DEBUG
import SwiftUI

extension UIView {
    private struct ViewRepresentable : UIViewRepresentable {
        
        let uiview : UIView
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
        }
        
        func makeUIView(context: Context) -> some UIView {
            return uiview
        }
    }
    func getPreview() -> some View {
        ViewRepresentable(uiview: self)
    }
}

#endif

