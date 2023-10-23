//
//  CustomSlider.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/23.
//

import UIKit

final class CustomSlider: UISlider {

    private let baseLayer = CALayer()
    private let trackLayer = CAGradientLayer()
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setup()
    }

    private func setup() {
        clear()
        createBaseLayer()
        createThumbImageView()
        configureTrackLayer()
        addUserInteractions()
        value = 0.5
        valueChanged(self)
    }

    private func clear() {
        tintColor = .clear
        maximumTrackTintColor = .clear
        backgroundColor = .clear
        thumbTintColor = .clear
    }

    private func createBaseLayer() {
        baseLayer.masksToBounds = true
        baseLayer.backgroundColor = Color.artistackSystem4.cgColor
        baseLayer.frame = .init(x: 0, y: frame.height / 4, width: frame.width, height: frame.height / 8)
        baseLayer.cornerRadius = baseLayer.frame.height / 2
        layer.insertSublayer(baseLayer, at: 0)
    }

    private func configureTrackLayer() {
        let firstColor = Color.purple.cgColor
        let secondColor = Color.pink.cgColor
        trackLayer.colors = [firstColor, secondColor]
        trackLayer.startPoint = .init(x: 0, y: 0.5)
        trackLayer.endPoint = .init(x: 1, y: 0.5)
        trackLayer.frame = .init(x: 0, y: frame.height / 4, width: 0, height: frame.height / 8)
        trackLayer.cornerRadius = trackLayer.frame.height / 2
        layer.insertSublayer(trackLayer, at: 1)
    }

    private func addUserInteractions() {
        addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
    }

    @objc private func valueChanged(_ sender: CustomSlider) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        let thumbRectA = thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
        trackLayer.frame = CGRect(x: 0, y: baseLayer.frame.origin.y, width: thumbRectA.midX, height: baseLayer.frame.height)
        CATransaction.commit()
    }

    private func createThumbImageView() {
        let thumbSize = (3 * frame.height) / 4
        
        let thumbView = UIView(frame: .init(x: 0, y: 0, width: thumbSize, height: thumbSize))
        thumbView.backgroundColor = Color.artistackSystem10
        thumbView.center = CGPoint(x: bounds.width * CGFloat(value), y: bounds.height / 2)
        thumbView.layer.cornerRadius = thumbSize / 2
        
        let thumbSnapshot = thumbView.snapshot
        setThumbImage(thumbSnapshot, for: .normal)
        setThumbImage(thumbSnapshot, for: .highlighted)
        setThumbImage(thumbSnapshot, for: .application)
        setThumbImage(thumbSnapshot, for: .disabled)
        setThumbImage(thumbSnapshot, for: .focused)
        setThumbImage(thumbSnapshot, for: .reserved)
        setThumbImage(thumbSnapshot, for: .selected)
    }
}
