//
//  ToolTipView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit

final class ToolTipView: UIView {
   
    private let containerView = UIView()
    private let label = UILabel().then{
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 13)
    }
    private let tipView = TipView()
    
    
    private let textColor: UIColor
    private let bgColor: UIColor
    
    init(title: String?, textColor: UIColor = .white, backgroundColor: UIColor = .systemIndigo, tipPosition: TipPosition, isRounded: Bool = false) {
        label.text = title
        tipView.tipPosition = tipPosition
        self.textColor = textColor
        self.bgColor = backgroundColor
        self.containerView.layer.cornerRadius = isRounded ? 4 : 0
        
        super.init(frame: .zero)
        
        setupUI()
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        backgroundColor = .clear
        label.textColor = textColor
        containerView.backgroundColor = bgColor
        tipView.bgColor = bgColor
    }
    
    private func setupLayout() {
        addSubview(containerView)
        containerView.addSubview(label)
        containerView.addSubview(tipView)
        switch tipView.tipPosition{
        case .top:
            layoutTopTip()
        case .bottom:
            layoutBottomTip()
        }
    }
    
    private func layoutTopTip() {
        containerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5))
        }
        
        tipView.snp.makeConstraints{
            $0.size.equalTo(CGSize(width: 10, height: 5))
            $0.bottom.equalTo(containerView.snp.top)
            $0.centerX.equalToSuperview()
        }
    }

    private func layoutBottomTip() {
        containerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }
        
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5))
        }
        
        tipView.snp.makeConstraints{
            $0.size.equalTo(CGSize(width: 10, height: 5))
            $0.top.equalTo(containerView.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
    }
}
