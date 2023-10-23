//
//  HomeView.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class HomeView: BaseView {
    
    let headerLabel = UILabel().then{
        $0.text = "최신"
        $0.font = Font.bold18
    }

    lazy var postTableView = UITableView().then{
        $0.register(cell: PostCell.self)
        $0.isPagingEnabled = true
        $0.backgroundColor = Color.black
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never
    }

    
    let progressView = UIView().then{
        $0.backgroundColor = Color.white
    }
    
    
    override func setLayouts() {
        addSubviews(postTableView, headerLabel, progressView)
        postTableView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.bottom.equalTo(progressView.snp.top)
        }
        headerLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(20)
        }
        progressView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(3)
        }
    }
}
