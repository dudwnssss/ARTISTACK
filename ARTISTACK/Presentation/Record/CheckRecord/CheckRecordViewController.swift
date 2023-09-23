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
        view.backgroundColor = .black
        setNavigationBar()
        checkRecordView.completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
        checkRecordView.volumeButton.addTarget(self, action: #selector(volumeButtonDidTap), for: .touchUpInside)
    }
    
    @objc func dismissButtonDidTap(){
        navigationController?.dismiss(animated: true)
    }
    
    @objc func completeButtonDidTap(){
        let vc = UploadViewController()
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func volumeButtonDidTap(){
        let bottomSheetViewController = BottomSheetViewController(type: .volume, contentViewController: VolumeViewController())
        present(bottomSheetViewController, animated: true)
    }
    
    func setNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "dismiss"), style: .plain, target: self, action: #selector(dismissButtonDidTap))
    }


}
