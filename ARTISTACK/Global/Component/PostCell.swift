//
//  PostCell.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit

final class PostCell: UITableViewCell{
    
    let contentBackgroundView = UIView().then{
        $0.backgroundColor = .systemMint
    }
    
    let userTableView = UITableView()
    
    let codeButton = UIButton().then{
        $0.setImage(UIImage(named: "code"), for: .normal)
    }
    let likeButton = UIButton().then{
        $0.setImage(UIImage(named: "like"), for: .normal)
    }
    let likeCountLabel = UILabel().then{
        $0.text = "34"
        $0.font = .boldSystemFont(ofSize: 15)
        
    }
    let stackButton = UIButton().then{
        $0.setImage(UIImage(named: "stack"), for: .normal)
    }
    let stackCountLabel = UILabel().then{
        $0.text = "5"
        $0.font = .boldSystemFont(ofSize: 15)
    }
    let titleLabel = UILabel().then{
        $0.backgroundColor = .blue
        $0.text = "오랜만에 피아노"
        $0.font = .boldSystemFont(ofSize: 16)

    }
    let descriptionLabel = UILabel().then{
        $0.text = "오랜만에피아노라서약간어색하네요최대최대글자수입최대최대최대최대최대최대글자수입니다최대최대최대"
        $0.numberOfLines = 0
        $0.font = .boldSystemFont(ofSize: 14)

    }
    let infoStackView = UIStackView().then{
        $0.spacing = 10
        $0.alignment = .leading
        $0.axis = .vertical
        $0.distribution = .fill
        $0.backgroundColor = .red
    }
    let othersButton = UIButton().then{
        $0.setImage(UIImage(named: "more"), for: .normal)
    }
    
    let moreButton = UIButton().then{
        $0.setTitle("더보기", for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 14)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayouts()
        setProperties()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayouts() {
        //        contentView.addSubview(contentBackgroundView)
        //        contentBackgroundView.snp.makeConstraints {
        //            $0.edges.equalToSuperview()
        //        }
        contentView.addSubviews(othersButton, stackButton, stackCountLabel, likeButton, likeCountLabel, codeButton, infoStackView, moreButton)
        infoStackView.addArrangedSubviews(titleLabel, descriptionLabel)
        othersButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-8)
            $0.bottom.equalToSuperview().offset(-10)
        }
        stackCountLabel.snp.makeConstraints {
            $0.bottom.equalTo(othersButton.snp.top)
            $0.centerX.equalTo(othersButton)
        }
        stackButton.snp.makeConstraints {
            $0.bottom.equalTo(stackCountLabel.snp.top).offset(4)
            $0.centerX.equalTo(othersButton)
        }
        likeCountLabel.snp.makeConstraints {
            $0.bottom.equalTo(stackButton.snp.top)
            $0.centerX.equalTo(othersButton)
        }
        likeButton.snp.makeConstraints {
            $0.bottom.equalTo(likeCountLabel.snp.top).offset(4)
            $0.centerX.equalTo(othersButton)
        }
        codeButton.snp.makeConstraints {
            $0.bottom.equalTo(likeButton.snp.top)
            $0.centerX.equalTo(othersButton)
        }
        
        infoStackView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.lessThanOrEqualTo(othersButton.snp.leading).offset(-10)
            
        }
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
        }
        moreButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(12)
            $0.centerY.equalTo(titleLabel)
        }
    }
    func setProperties(){
        contentView.backgroundColor = .black
    }
}

//extension PostCell: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier) as? UserCell else{
//            return UITableViewCell()
//        }
//        return cell
//    }
//    
//    
//}
