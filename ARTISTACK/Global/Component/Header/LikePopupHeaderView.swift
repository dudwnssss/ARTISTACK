//
//  likePopupHeaderView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/25.
//

import UIKit

final class LikePopupHeaderView: UITableViewHeaderFooterView {
    
    let headerTitleLabel = UILabel().then{
        $0.text = "좋아요 한 스태커"
        $0.font = .boldSystemFont(ofSize: 16)
    }
    let popupIndicatorView = UIView().then{
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 2
    }
    let separatorView = SeparatorView()
    let likeImageView = UIImageView().then{
        $0.image = UIImage(named: "like.small")
    }
    let likeCountLabel = UILabel().then{
        $0.text = "34"
        $0.font = .boldSystemFont(ofSize: 15)
    }
    let playImageView = UIImageView().then{
        $0.image = UIImage(named: "play.small")
    }
    let playCountLabel = UILabel().then{
        $0.text = "1234"
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setProperties()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProperties(){
        backgroundColor = .blue
    }
    func setLayouts(){
        addSubviews(popupIndicatorView, likeImageView, likeCountLabel, playImageView, playCountLabel, separatorView, headerTitleLabel)
        popupIndicatorView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(35)
            $0.height.equalTo(3)
        }
        likeImageView.snp.makeConstraints {
            $0.top.equalTo(popupIndicatorView.snp.bottom).offset(22)
            $0.size.equalTo(24)
            $0.centerX.equalToSuperview().offset(-50)
        }
        likeCountLabel.snp.makeConstraints {
            $0.leading.equalTo(likeImageView.snp.trailing).offset(2)
            $0.centerY.equalTo(likeImageView)
        }
        playImageView.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.leading.equalTo(likeCountLabel.snp.trailing).offset(22)
            $0.centerY.equalTo(likeImageView)
        }
        playCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(likeImageView)
            $0.leading.equalTo(playImageView.snp.trailing).offset(2)
        }
        separatorView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(likeImageView.snp.bottom).offset(18)
            
        }
        headerTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(separatorView)
            $0.top.equalTo(separatorView.snp.bottom).offset(24)
        }
    }
}
