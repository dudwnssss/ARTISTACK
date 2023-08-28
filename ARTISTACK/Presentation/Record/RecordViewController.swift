//
//  RecordViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/23.
//

import UIKit

class RecordViewController: BaseViewController {

    let recordView = RecordView()
    
    override func loadView() {
        self.view = recordView
    }
    
    @objc func dismissButtonDidTap(){
        dismiss(animated: true)
    }
    
    @objc func recordButtonDidTap(){
        let vc = CheckRecordViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.isNavigationBarHidden = true
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: false)
    }
    
    override func setProperties() {
        view.backgroundColor = .black
        recordView.dismissButton.addTarget(self, action: #selector(dismissButtonDidTap), for: .touchUpInside)
        recordView.recordButton.addTarget(self, action: #selector(recordButtonDidTap), for: .touchUpInside)
    }
    
    
}


