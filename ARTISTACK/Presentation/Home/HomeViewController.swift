//
//  ViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit
import RxCocoa
import RxSwift


final class HomeViewController: BaseViewController {
    
    private  let homeView = HomeView()
    let viewModel = HomeViewModel()
    var currentPageIndex: Int = 0
    
    override func loadView() {
        self.view = homeView
    }
    
    override func setProperties() {
        homeView.postTableView.delegate = self
        homeView.postTableView.dataSource = self
        print(UserDefaults.standard.string(forKey: "accessToken"))
        
    }
    
    override func bind() {
        viewModel.projectList.bind { [weak self] playlist in
            self?.homeView.postTableView.reloadData()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let cell = homeView.postTableView.visibleCells.first as? PostCell {
            print(#fileID, #function, #line, "- ")
            cell.playerView.play()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let cell = homeView.postTableView.visibleCells.first as? PostCell {
            cell.playerView.pause()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.projectList.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.delegateCodeButton = self
        cell.delegateReportButton = self
        cell.configureCell(project: viewModel.projectList.value[indexPath.row])
        cell.viewModel.data = viewModel.projectList.value[indexPath.row]
        if let url = NSURL(string: viewModel.projectList.value[indexPath.row].videoUrl) {
            cell.playerView.configure(url: url, fileExtension: "mp4", size: (Int(tableView.frame.width), Int(tableView.frame.height)))
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return homeView.postTableView.frame.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? PostCell else {return}
        cell.playerView.pause()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        currentPageIndex = indexPath.row
        print(currentPageIndex)
    }
}

extension HomeViewController: UIScrollViewDelegate {
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            if let cell = homeView.postTableView.cellForRow(at: IndexPath(row: currentPageIndex, section: 0)) as? PostCell {
                cell.playerView.replay()
            }
           }
}

extension HomeViewController: CodeButtonDelegate {
    func codeButtonDidTap(showHeader: Bool) {
        homeView.headerLabel.isHidden = !showHeader
    }
}

extension HomeViewController: ReportButtonDelegate {
    func reportButtonDidTap() {
        let vc = ReportViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
