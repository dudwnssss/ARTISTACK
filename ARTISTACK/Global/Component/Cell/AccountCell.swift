//
//  accountCell.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

enum AccountType: CaseIterable{
    case apple
    case kakao
    
    var title: String {
        switch self {
        case .apple:
            return "애플 계정 회원"
        case .kakao:
            return "카카오 계정 회원"
        }
    }
    var image: UIImage {
        switch self {
        case .apple:
            return UIImage(named: "apple")!
        case .kakao:
            return UIImage(named: "kakao")!
        }
    }
}

class AccountCell: UITableViewCell {

    var accountType: AccountType = .kakao
    
    let titleLabel = UILabel().then{
        $0.text = "나의 계정 정보"
        $0.font = .boldSystemFont(ofSize: 16)
    }
    let accountImageView = UIImageView()
    let accountLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 14)
    }
    let separatorView = UIView().then{
        $0.backgroundColor = .lightGray
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setProperties()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    convenience init(accountType: AccountType){
        self.init()
        self.accountType = accountType
    }
    
    func setProperties(){
        backgroundColor = .clear
        accountLabel.text = accountType.title
        accountImageView.image = accountType.image
    }
    
    func setLayouts(){
        contentView.addSubviews(titleLabel, accountImageView, accountLabel, separatorView)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(20)
        }
        accountImageView.snp.makeConstraints {
            $0.size.equalTo(30)
            $0.leading.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
        }
        accountLabel.snp.makeConstraints {
            $0.centerY.equalTo(accountImageView)
            $0.leading.equalTo(accountImageView.snp.trailing).offset(12)
        }
        separatorView.snp.makeConstraints {
            $0.bottom.horizontalEdges.equalToSuperview()
            $0.height.equalTo(11)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
