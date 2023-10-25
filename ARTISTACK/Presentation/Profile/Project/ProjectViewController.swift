//
//  ProjectViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/10/25.
//

import UIKit

class ProjectViewController: BaseViewController {
    
    let projectView = HomeView()
    let viewModel = ProjectViewModel()
    var currentPageIndex: Int = 0
    
    override func loadView() {
        self.view = projectView
    }
    
    override func setProperties() {
        projectView.postTableView.delegate = self
        projectView.postTableView.dataSource = self
    }
    
    override func bind() {
        viewModel.projectList.bind { [weak self] playlist in
            self?.projectView.postTableView.reloadData()
        }
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        if let cell = projectView.postTableView.visibleCells.first as? PostCell {
//            cell.playerView.replay()
//        }
//    }
}

extension ProjectViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.projectList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.delegateCodeButton = self
        cell.configureCell(project: viewModel.projectList.value[indexPath.row])
        if let url = NSURL(string: viewModel.projectList.value[indexPath.row].videoUrl) {
            cell.playerView.configure(url: url, fileExtension: "mp4", size: (Int(tableView.frame.width), Int(tableView.frame.height)))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return projectView.postTableView.frame.height
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

extension ProjectViewController: UIScrollViewDelegate {
    
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            if let cell = projectView.postTableView.cellForRow(at: IndexPath(row: currentPageIndex, section: 0)) as? PostCell {
                cell.playerView.replay()
            }
           }
}

extension ProjectViewController: CodeButtonDelegate {
    func codeButtonDidTap(showHeader: Bool) {
        projectView.headerLabel.isHidden = !showHeader
    }
}
