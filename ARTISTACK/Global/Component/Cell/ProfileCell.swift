//
//  ProfileCell.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit

final class ProfileCell: UICollectionViewCell {
    
    let backgroundImageView = UIImageView().then{
        $0.image = UIImage(named: "background.gradient")
    }
    let profileImageView = UIImageView().then{
        $0.image = UIImage(named: "person")
    }
    let nicknameLabel = UILabel().then{
        $0.backgroundColor = .systemPink
        $0.text = "dudansthanswkd"
        $0.font = .boldSystemFont(ofSize: 19)
    }
    let idLabel = UILabel().then{
        $0.backgroundColor = .systemPink
        $0.text = "@mikeannn"
        $0.font = .systemFont(ofSize: 15)
    }
    let descriptionLabel = UILabel().then{
        $0.backgroundColor = .systemPink
        $0.text = "최대글자수최대글자수최대글자수최대글자수최대글자수최대글자수최대글자수최대글"
        $0.numberOfLines = 2
        $0.font = .boldSystemFont(ofSize: 14)
    }
    
    let profileEditButton = UIButton().then{
        $0.setImage(UIImage(systemName: "pencil"), for: .normal)
        $0.tintColor = .lightGray
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
        setLayouts()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayouts(){
        contentView.addSubviews(backgroundImageView, profileImageView, nicknameLabel, idLabel, descriptionLabel, profileEditButton)
        backgroundImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(contentView.snp.width).multipliedBy(0.25)
            $0.centerY.equalToSuperview()
        }
        profileImageView.snp.makeConstraints {
            $0.center.equalTo(backgroundImageView)
            $0.size.equalTo(backgroundImageView).multipliedBy(0.9)
        }
        
        idLabel.snp.makeConstraints {
            $0.centerY.equalTo(backgroundImageView).offset(-4)
            $0.leading.equalTo(backgroundImageView.snp.trailing).offset(20)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.leading.equalTo(idLabel)
            $0.bottom.equalTo(idLabel.snp.top).offset(-10)
            }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(10)
            $0.leading.equalTo(idLabel)
            $0.trailing.lessThanOrEqualToSuperview().offset(-20)
            $0.bottom.lessThanOrEqualTo(backgroundImageView.snp.bottom)
        }
        
        profileEditButton.snp.makeConstraints {
            $0.leading.equalTo(nicknameLabel.snp.trailing)
            $0.centerY.equalTo(nicknameLabel)
            $0.size.equalTo(40)
        }
        
    }
    
    func setProperties(){
        
    }
    
}

#if DEBUG

import SwiftUI

struct ProfileCell_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCell().getPreview()
            .previewLayout(.fixed(width: 390, height: 127))
    }
}

#endif
