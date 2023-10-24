//
//  ViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit


final class HomeViewController: BaseViewController {
    
   private  let homeView = HomeView()
    let viewModel = HomeViewModel()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func setProperties() {
        homeView.postTableView.delegate = self
        homeView.postTableView.dataSource = self
        print(UserDefaults.standard.string(forKey: "accessToken"))
    }
    
    override func bind() {
        viewModel.projectList.bind { [weak self] _ in
            self?.homeView.postTableView.reloadData()
        }
    }
    

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.projectList.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return homeView.postTableView.frame.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
