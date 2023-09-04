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
        navigationController?.pushViewController(vc, animated: false)
        
    }
    
    func setNavigationBar(){
        navigationController?.setNavigationBarAppearance(isClear: true)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "dismiss"), style: .plain, target: self, action: #selector(dismissButtonDidTap))

    }
    
    override func setProperties() {
        setNavigationBar()
        view.backgroundColor = .black
        recordView.recordButton.addTarget(self, action: #selector(recordButtonDidTap), for: .touchUpInside)
    }
    
    
    
}


