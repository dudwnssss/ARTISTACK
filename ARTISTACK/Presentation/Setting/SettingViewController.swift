//
//  SettingViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

enum SettingType: CaseIterable{
    case account
    case terms
    case privacy
    
    var settingTitle: String {
        switch self {
        case .account:
            return "계정"
        case .terms:
            return "이용약관"
        case .privacy:
            return "개인정보처리방침"
        }
    }
    
    var settingImage: UIImage {
        switch self {
        case .account:
            return UIImage(named: "account")!
        case .terms:
            return UIImage(named: "terms")!
        case .privacy:
            return UIImage(named: "privacy")!
        }
    }
}

class SettingViewController: BaseViewController {
    
    let barButtonItem = CustomBarButtonItem(isTitleWithBackButton: true).then{
        $0.titleLabel.text = "설정"
    }
    
    override func setProperties() {
        setNavigationBar()
    }
    
    private lazy var tableView = UITableView().then{
        $0.separatorColor = Color.artistackSystem2
        $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .clear
        $0.rowHeight = 55
    }
    let settingType = SettingType.allCases
    
    override func setLayouts() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setNavigationBar(){
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)
    }
    
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        
        let accessoryImageView = UIImageView().then{
            $0.image = UIImage(named: "accessory")
        }

        accessoryImageView.sizeToFit()
        cell.accessoryView = accessoryImageView
        var content = cell.defaultContentConfiguration()
        content.text =  settingType[indexPath.row].settingTitle
        content.textProperties.color = Color.white
        content.image = settingType[indexPath.row].settingImage
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .none)
        if indexPath.row == 0{
            let vc = AccountViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            print(indexPath)
        }
    }
}
