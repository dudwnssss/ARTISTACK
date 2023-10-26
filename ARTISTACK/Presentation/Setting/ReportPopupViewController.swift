//
//  ReportPopupViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class ReportPopupViewController: BaseViewController {

    let checkImageView = UIImageView().then{
        $0.image = Image.check
    }
    let confirmButton = UIButton().then{
        $0.setTitle("확인", for: .normal)
        $0.titleLabel?.font = Font.bold16
    }
    let thanksLabel = UILabel().then{
        $0.text = "알려주셔서 감사합니다"
        $0.font = Font.bold16
    }
    let descriptionLabel = UILabel().then{
        $0.font = Font.medium13
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.text = "회원님의 소중한 의견은 Artistack 커뮤니티를\n안전하게 유지하는데 도움이 됩니다."
        $0.textColor = Color.artistackSystem4
    }
    let separatorView = SeparatorView()
    let containerView = UIView().then{
        $0.backgroundColor = Color.artistackSystem1
        $0.layer.cornerRadius = 5
    }
    
    override func setProperties() {
        view.layer.backgroundColor = UIColor(white: 0, alpha: 0.5).cgColor
        confirmButton.addTarget(self, action: #selector(confirmButtonDidTap), for: .touchUpInside)
    }
    
    @objc func confirmButtonDidTap(){
//        navigationController?.popToRootViewController(animated: true)
        dismiss(animated: true)
    }
    
    
    override func setLayouts() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(36)
            $0.height.equalTo(containerView.snp.width).multipliedBy(0.75)
        }
        containerView.addSubviews(checkImageView, thanksLabel, descriptionLabel, separatorView, confirmButton)
        confirmButton.snp.makeConstraints {
            $0.bottom.horizontalEdges.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.25)
        }
        separatorView.snp.makeConstraints {
            $0.bottom.equalTo(confirmButton.snp.top)
            $0.horizontalEdges.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints {
            $0.bottom.equalTo(separatorView).offset(-38)
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.lessThanOrEqualToSuperview().inset(40)
        }
        thanksLabel.snp.makeConstraints {
            $0.bottom.equalTo(descriptionLabel.snp.top).offset(-15)
            $0.centerX.equalToSuperview()
        }
        checkImageView.snp.makeConstraints {
            $0.width.equalTo(38)
            $0.height.equalTo(24)
            $0.bottom.equalTo(thanksLabel.snp.top).offset(-20)
            $0.centerX.equalToSuperview()
        }
    }
    
    
    
}
