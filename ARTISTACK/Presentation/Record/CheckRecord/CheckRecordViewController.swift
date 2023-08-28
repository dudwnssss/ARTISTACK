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
    
    override func setProperties() {
        checkRecordView.completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
        checkRecordView.dismissButton.addTarget(self, action: #selector(dismissButtonDidTap), for: .touchUpInside)
    }
    
    @objc func dismissButtonDidTap(){
        dismiss(animated: true)
        print(#fileID, #function, #line, "- ")
    }
    
    @objc func completeButtonDidTap(){
        let vc = UploadViewController()
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(vc, animated: true)
    }
}
