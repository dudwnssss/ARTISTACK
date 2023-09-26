//
//  AccountViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit
//todo
enum SystemType: String, CaseIterable{
    case logout = "로그아웃"
    case withdraw = "탈퇴하기"
}

class AccountViewController: BaseViewController {

    private lazy var tableView = UITableView().then{
        $0.register(cell: AccountCell.self)
        $0.separatorColor = .artistackSystem2
        $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .clear
    }
    let systemType = SystemType.allCases
    let barButtonItem = CustomBarButtonItem(isTitleWithBackButton: true).then{
        $0.titleLabel.text = "계정"
    }
    
    override func setLayouts() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    override func setProperties() {
        setNavigationBar()
    }
    
    func setNavigationBar(){
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)
    }
    
}

extension AccountViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let accountCell: AccountCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            accountCell.accountType = .apple
            return accountCell
        } else {
            let cell = UITableViewCell()
            
            cell.backgroundColor = .clear
            var content = cell.defaultContentConfiguration()
            content.text = systemType[indexPath.row - 1].rawValue
            content.textProperties.color = .white
            cell.contentConfiguration = content
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 110 : 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1{
            RootSwitcher.update(.login)
        } else if indexPath.row == 2{
            Network.shared.request(type: WithdrawResponse.self, api: UsersTarget.withdraw) { result in
                switch result {
                case .success(let success):
                    if success.data == true{
                        RootSwitcher.update(.login)
                    }
                case .failure(let failure):
                    debugPrint(result)
                }
            }
        }
    }
}
