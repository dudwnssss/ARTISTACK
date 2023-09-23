//
//  CustomSlider.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/23.
//

import UIKit

final class CustomSlider: UISlider {
    
    private let trackLayer = CAGradientLayer()
    private let baseLayer = CALayer()

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
    }
    
    private func clear() {
        tintColor = .clear
        maximumTrackTintColor = .clear
        backgroundColor = .clear
        thumbTintColor = .clear
    }
    
    private func createBaseLayer() {
        baseLayer.borderWidth = 1
            baseLayer.borderColor = UIColor.lightGray.cgColor
            baseLayer.masksToBounds = true
            baseLayer.backgroundColor = UIColor.white.cgColor
            baseLayer.frame = .init(x: 0, y: frame.height / 2 - baseLayer.frame.height / 2, width: frame.width, height: frame.height / 2)
            baseLayer.cornerRadius = baseLayer.frame.height / 2
            layer.insertSublayer(baseLayer, at: 0)
    }
    
    private func configureTrackLayer() {
        let firstColor = UIColor.artistackPurple?.cgColor
            let secondColor = UIColor.artistackPink?.cgColor
            trackLayer.colors = [firstColor, secondColor]
            trackLayer.startPoint = .init(x: 0, y: 0.5)
            trackLayer.endPoint = .init(x: 1, y: 0.5)
            trackLayer.frame = .init(x: 0, y: frame.height / 2 - trackLayer.frame.height / 2, width: 0, height: frame.height / 2)
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
        trackLayer.frame = .init(x: 0, y: frame.height / 4, width: thumbRectA.midX, height: frame.height / 2)
        CATransaction.commit()
    }
    
    private func createThumbImageView() {
        let thumbSize = (3 * frame.height) / 4
        let thumbView = UIView(frame: .init(x: 0, y: 0, width: thumbSize, height: thumbSize))
        thumbView.layer.cornerRadius = thumbSize / 2
        let thumbSnapshot = thumbView.snapshot
        setThumbImage(thumbSnapshot, for: .normal)
        setThumbImage(thumbSnapshot, for: .highlighted)
    }
}
