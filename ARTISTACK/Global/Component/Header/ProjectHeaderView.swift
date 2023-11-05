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
        $0.font = Font.medium15
    }
    let projectCountLabel = UILabel().then{
        $0.text = "13"
        $0.font = Font.bold15
    }
    let separatorView = SeparatorView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
        setLayouts()
    }
    
    func setProperties(){
        backgroundColor = Color.artistackSystem1
    }
    func setLayouts(){
        addSubviews(headerTitleLabel, projectCountLabel, separatorView)
        headerTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
        projectCountLabel.snp.makeConstraints {
            $0.leading.equalTo(headerTitleLabel.snp.trailing).offset(15)
            $0.centerY.equalTo(headerTitleLabel)
        }
        separatorView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    func configureHeader(count: Int) {
        projectCountLabel.text = "\(count)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func prepareForReuse() {
        super.prepareForReuse()
    }


    
    
}
