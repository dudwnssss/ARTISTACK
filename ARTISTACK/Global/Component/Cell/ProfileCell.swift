//
//  ProfileCell.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

final class ProfileCell: UICollectionViewCell {
    
    var disposeBag = DisposeBag()
    var buttonAction : ()->Void = {}

    let profileImageView = ProfileImageView()
    
    let nicknameLabel = UILabel().then{
        $0.text = "dudansthanswkd"
        $0.font = Font.bold19
    }
    let idLabel = UILabel().then{
        $0.text = "@mikeannn"
        $0.font = Font.medium15
        $0.textColor = Color.artistackSystem3
    }
    let descriptionLabel = UILabel().then{
        $0.text = "최대글자수최대글자수최대글자수최대글자수최대글자수최대글자수최대글자수최대글"
        $0.numberOfLines = 2
        $0.font = Font.bold14
        $0.textColor = Color.artistackSystem6
    }
    
    let profileEditButton = UIButton().then{
        $0.setImage(UIImage(systemName: "pencil"), for: .normal)
        $0.tintColor = Color.artistackSystem6
    }
    
    
    @objc func profileEditButtonDidTap(){
        buttonAction()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
        setLayouts()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    func configureCell(profile: UserData){
        idLabel.text = "@" + profile.artistackId
        nicknameLabel.text = profile.nickname
        descriptionLabel.text = profile.description ?? ""
        guard let urlString = profile.profileImgURL,
              let url = URL(string: urlString) else {
            print("외안돼")
            return}
        profileImageView.profileImageView.kf.setImage(with: url)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayouts(){
        contentView.addSubviews( profileImageView, nicknameLabel, idLabel, descriptionLabel, profileEditButton)

        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(contentView.snp.width).multipliedBy(0.25)
            $0.centerY.equalToSuperview()
        }
        
        idLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView).offset(-4)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.leading.equalTo(idLabel)
            $0.bottom.equalTo(idLabel.snp.top).offset(-9)
            }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(5)
            $0.leading.equalTo(idLabel)
            $0.trailing.lessThanOrEqualToSuperview().offset(-20)
            $0.bottom.lessThanOrEqualTo(profileImageView.snp.bottom)
        }
        
        profileEditButton.snp.makeConstraints {
            $0.leading.equalTo(nicknameLabel.snp.trailing)
            $0.centerY.equalTo(nicknameLabel)
            $0.size.equalTo(40)
        }
        
    }
    
    func setProperties(){
        profileEditButton.addTarget(self, action: #selector(profileEditButtonDidTap), for: .touchUpInside)
    }
    
}


