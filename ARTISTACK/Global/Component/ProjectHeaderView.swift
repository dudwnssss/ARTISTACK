//
//  ProjectHeaderView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit

final class ProjectHeaderView: UICollectionReusableView {
        
    let headerTitleLabel = UILabel().then{
        $0.text = "내 연주"
    }
    let projectCountLabel = UILabel().then{
        $0.text = "13"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
        setLayouts()
    }
    
    func setProperties(){
        
    }
    func setLayouts(){
        addSubviews(headerTitleLabel, projectCountLabel)
        headerTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
        projectCountLabel.snp.makeConstraints {
            $0.leading.equalTo(headerTitleLabel.snp.trailing).offset(15)
            $0.centerY.equalTo(headerTitleLabel)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func prepareForReuse() {
        super.prepareForReuse()
    }


    
    
}
