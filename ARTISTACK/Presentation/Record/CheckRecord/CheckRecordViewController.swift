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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
    }
    
    override func setProperties() {
        checkRecordView.completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
        checkRecordView.dismissButton.addTarget(self, action: #selector(dismissButtonDidTap), for: .touchUpInside)
    }
    
    @objc func dismissButtonDidTap(){
        navigationController?.popViewController(animated: false)
        print(#fileID, #function, #line, "- ")
    }
    
    @objc func completeButtonDidTap(){
        let vc = UploadViewController()
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("***", #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = true
        print("***", #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("***", #function)
        navigationController?.isNavigationBarHidden = true
    }
}
