//
//  VolumeViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/12.
//

import UIKit

class VolumeViewController: BaseViewController {
    
    let volumeView = VolumeView()
    override func loadView() {
        self.view = volumeView
    }
    
    
}