//
//  ProfileImageViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/14.
//

import UIKit
import PhotosUI

enum EditType{
    case album
    case normal
    
    var title: String {
        switch self {
        case .album:
            return "앨범에서 선택"
        case .normal:
            return "기본 이미지로 변경"
        }
    }
}

class EditProfileImageViewController: BaseViewController{
    
    var normal: (()->Void)?
    let editProfileImageView = EditProfileImageView()

    override func loadView() {
        self.view = editProfileImageView
    }
    
    override func setProperties() {
        editProfileImageView.albumButton.addTarget(self, action: #selector(albumButtonDidTap), for: .touchUpInside)
        editProfileImageView.normalButton.addTarget(self, action: #selector(normalButtonDidTap), for: .touchUpInside)
    }
    
    @objc func albumButtonDidTap(){
        var configuration = PHPickerConfiguration()
        configuration.filter = .any(of: [.images])
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc func normalButtonDidTap(){
        print(#fileID, #function, #line, "- ")
        normal?()
        dismiss(animated: true)
    }

}

extension EditProfileImageViewController: PHPickerViewControllerDelegate{
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        print(results.description)
    }
}
