//
//  ProjectCell.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit

final class ProjectCell: UICollectionViewCell {
    
    let projectImageView = UIImageView().then{
        $0.backgroundColor = Color.black
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    let playImageView = UIImageView().then{
        $0.image = Image.play
    }
    let playCountLabel = UILabel().then{
        $0.text = "124"
        $0.font = Font.bold12
    }
    let stackImageView = UIImageView().then{
        $0.image = Image.stackProfile
    }
    let stackCountLabel = UILabel().then{
        $0.text = "5"
        $0.font = Font.medium12
    }
    let likeImageVIew = UIImageView().then{
        $0.image = Image.likeProfile
    }
    let likeCountLabel = UILabel().then{
        $0.text = "333"
        $0.font = Font.medium12
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
        setLayouts()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        projectImageView.image = nil
        likeCountLabel.text = nil
        playCountLabel.text = nil
        stackCountLabel.text = nil
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(project: Project){
        likeCountLabel.text = "\(project.likeCount)"
        stackCountLabel.text = "\(project.stackCount)"
    }
 
}

extension ProjectCell {
    
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
            $0.trailing.equalToSuperview().offset(-10)
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
