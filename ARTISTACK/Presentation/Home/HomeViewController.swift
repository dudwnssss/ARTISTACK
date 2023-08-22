//
//  ViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit


class HomeViewController: BaseViewController {
    
    let headerLabel = UILabel().then{
        $0.text = "최신"
        $0.font = .boldSystemFont(ofSize: 18)
    }

    lazy var postTableView = UITableView().then{
        $0.register(cell: PostCell.self)
        $0.isPagingEnabled = true
        $0.backgroundColor = .black
        $0.delegate = self
        $0.dataSource = self
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never
    }
    

    
    let progressView = UIView().then{
        $0.backgroundColor = .white
    }
    
    override func setLayouts() {
        view.addSubviews(postTableView, headerLabel, progressView)
        postTableView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.bottom.equalTo(progressView.snp.top)
        }
        headerLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        progressView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(3)
        }
    }
    
    override func setProperties() {

    }
    


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.contentView.backgroundColor = [UIColor.red, UIColor.blue, UIColor.purple, UIColor.darkGray, UIColor.black].randomElement()
//        cell.backgroundColor = .clear
        cell.userTableView.reloadData()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return postTableView.frame.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
