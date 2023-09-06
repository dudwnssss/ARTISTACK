//
//  ViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit


class HomeViewController: BaseViewController {
    
    let homeView = HomeView()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func setProperties() {
        homeView.postTableView.delegate = self
        homeView.postTableView.dataSource = self
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.contentView.backgroundColor = [UIColor.red, UIColor.blue, UIColor.purple, UIColor.darkGray, UIColor.black].randomElement()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return homeView.postTableView.frame.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
