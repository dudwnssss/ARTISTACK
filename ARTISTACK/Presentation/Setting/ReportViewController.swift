//
//  ReportViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

enum ReportType: String, CaseIterable{
    case danger = "위험한 행동 및 도전"
    case teen = "미성년자 안전"
    case suicide = "자살, 자해 및 섭식 장애"
    case adult = "성인 노출 및 성행위"
    case torment = "괴롭힘 및 희롱"
    case aversion = "혐오적 행동"
    case extremism = "폭력적 극단주의"
    case spam = "스팸 및 허위 참여"
    case disinformation = "유해한 허위 정보"
    case illegal = "불법 행위 및 규제 품목"
    case violent = "폭력적이고 노골적인 콘텐츠"
    case property = "지식 재산 침해"
    case others = "기타"
}

class ReportViewController: BaseViewController {

    private lazy var tableView = UITableView().then{
        $0.separatorColor = Color.artistackSystem2
        $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .clear
        $0.rowHeight = 55
    }
    let reportType = ReportType.allCases

    override func setProperties() {
        view.backgroundColor = Color.black
    }
    
    override func setLayouts() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension ReportViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reportType.count
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
        content.text = reportType[indexPath.row].rawValue
        content.textProperties.color = Color.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ReportPopupViewController()
        tableView.reloadRows(at: [indexPath], with: .none)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
//        navigationController?.pushViewController(vc, animated: false)
        present(vc, animated: false)
    }
}
