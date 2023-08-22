//
//  ProjectCell.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit

final class ProjectCell: UICollectionViewCell {
    
    let projectImageView = UIImageView().then{
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    let playImageView = UIImageView().then{
        $0.image = UIImage(named: "play")
    }
    let playCountLabel = UILabel().then{
        $0.text = "124"
        $0.font = .boldSystemFont(ofSize: 12)
    }
    let stackImageView = UIImageView().then{
        $0.image = UIImage(named: "stack.small")
    }
    let stackCountLabel = UILabel().then{
        $0.text = "5"
        $0.font = .systemFont(ofSize: 12)
    }
    let likeImageVIew = UIImageView().then{
        $0.image = UIImage(named: "like.small")
    }
    let likeCountLabel = UILabel().then{
        $0.text = "333"
        $0.font = .systemFont(ofSize: 12)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
        setLayouts()
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        projectImageView.image = nil
//        likeCountLabel.text = nil
//        playCountLabel.text = nil
//        stackCountLabel.text = nil
//    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayouts(){
        contentView.addSubviews(projectImageView, playImageView, playCountLabel, stackImageView, stackCountLabel, likeImageVIew, likeCountLabel)
        
        projectImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        playImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.top.equalToSuperview().offset(10)
            $0.size.equalTo(projectImageView.snp.width).multipliedBy(0.12)
        }
        
        playCountLabel.snp.makeConstraints {
            $0.leading.equalTo(playImageView.snp.trailing).offset(4)
            $0.centerY.equalTo(playImageView)
        }
        
        likeCountLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-4)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        likeImageVIew.snp.makeConstraints {
            $0.bottom.equalTo(likeCountLabel.snp.top).offset(-2)
            $0.centerX.equalTo(likeCountLabel)
            $0.size.equalTo(projectImageView.snp.width).multipliedBy(0.12)
        }
        
        stackCountLabel.snp.makeConstraints {
            $0.bottom.equalTo(likeImageVIew.snp.top).offset(-5)
            $0.centerX.equalTo(likeCountLabel)
        }
        
        stackImageView.snp.makeConstraints {
            $0.bottom.equalTo(stackCountLabel.snp.top).offset(-2)
            $0.centerX.equalTo(likeCountLabel)
            $0.size.equalTo(projectImageView.snp.width).multipliedBy(0.15)

        }
    }
    
    func setProperties(){
        
    }
}

#if DEBUG

import SwiftUI

struct ProjectCell_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCell().getPreview()
            .previewLayout(.fixed(width: 110, height: 180))
    }
}

#endif
