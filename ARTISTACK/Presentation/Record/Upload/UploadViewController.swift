//
//  UploadViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit

class UploadViewController: BaseViewController {

    let uploadView = UploadView()
    
    override func loadView() {
        self.view = uploadView
    }
   
    override func setProperties() {
        title = "게시하기"
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    

    


}
