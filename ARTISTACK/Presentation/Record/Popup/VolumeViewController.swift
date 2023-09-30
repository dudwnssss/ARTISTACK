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
    
    override func setProperties() {
        volumeView.completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
        volumeView.originalSoundSlider.addTarget(self, action: #selector(originalSliderDidChange), for: .valueChanged)
        volumeView.addedSoundSlider.addTarget(self, action: #selector(addedSliderDidChange), for: .valueChanged)
    }
    
    
    @objc func completeButtonDidTap(){
        dismiss(animated: true)
    }
    @objc func originalSliderDidChange(){
        print(volumeView.originalSoundSlider.value)
    }
    @objc func addedSliderDidChange(){
        print(volumeView.addedSoundSlider.value)
    }
}
