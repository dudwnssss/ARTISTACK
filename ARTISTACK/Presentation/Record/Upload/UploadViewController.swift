//
//  UploadViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit

class UploadViewController: BaseViewController {

    let uploadView = UploadView()
    let barButtonItem = CustomBarButtonItem(isTitleWithBackButton: true).then{
        $0.titleLabel.text = "게시하기"
    }
    
    override func loadView() {
        self.view = uploadView
    }
   
    override func setProperties() {
        hideKeyboardWhenTappedAround()
        setNavigationBar()
        uploadView.uploadButon.addTarget(self, action: #selector(uploadButtonDidTap), for: .touchUpInside)
    }
    
    func setNavigationBar(){
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func uploadButtonDidTap(){
        navigationController?.dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarAppearance(isClear: false)
    }


    


}
