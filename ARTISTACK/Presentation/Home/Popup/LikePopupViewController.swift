//
//  LikePopupViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/25.
//

import UIKit

class LikePopupViewController: BaseViewController {

    lazy var userTableView = UITableView().then{
        $0.register(LikePopupHeaderView.self, forHeaderFooterViewReuseIdentifier: LikePopupHeaderView.reuseIdentifier)
        $0.showsVerticalScrollIndicator = false
        $0.rowHeight = 55
        $0.register(cell: UserCell.self)
        $0.delegate = self
        $0.dataSource = self
        $0.separatorStyle = .none
        $0.backgroundColor = .black
    }
    
    override func setProperties() {
        view.backgroundColor = .white
    }
    
    override func setLayouts() {
        view.addSubview(userTableView)
        userTableView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.8)
        }
    }


}

extension LikePopupViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UserCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: LikePopupHeaderView = tableView.dequeHeaderFooterView()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 140
    }
}
