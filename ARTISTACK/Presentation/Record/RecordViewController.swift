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
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
//        navigationController?.changeNavigationBar(isClear: true)
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "dismiss"), style: .plain, target: self, action: #selector(dismissButtonDidTap))
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func setProperties() {
        setNavigationBar()
        view.backgroundColor = .black
        recordView.recordButton.addTarget(self, action: #selector(recordButtonDidTap), for: .touchUpInside)
    }
    
    
    
}


