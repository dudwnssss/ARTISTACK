//
//  CheckRecordViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class CheckRecordViewController: BaseViewController {
    
    let checkRecordView = CheckRecordView()
    
    override func loadView() {
        self.view = checkRecordView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarAppearance(isClear: true)
    }
    
    
    override func setProperties() {
        setNavigationBar()
        checkRecordView.completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
    }
    
    @objc func dismissButtonDidTap(){
        navigationController?.dismiss(animated: true)
    }
    
    @objc func completeButtonDidTap(){
        let vc = UploadViewController()
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "dismiss"), style: .plain, target: self, action: #selector(dismissButtonDidTap))
    }

}
