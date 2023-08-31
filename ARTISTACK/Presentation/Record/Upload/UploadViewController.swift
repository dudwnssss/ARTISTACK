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
    }
    
    func setNavigationBar(){
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID, #function, #line, "- ")
        navigationController?.isNavigationBarHidden = false
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print(#fileID, #function, #line, "- ")
//        navigationController?.isNavigationBarHidden = false
//    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        print(#fileID, #function, #line, "- ")
//    }
//
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = false
        print("***", #fileID, #function, #line, "- ")
    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("***", #fileID, #function, #line, "- ")
//        navigationController?.isNavigationBarHidden = false
//    }
    


}
