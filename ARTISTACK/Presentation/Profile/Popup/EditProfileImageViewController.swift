//
//  ProfileImageViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/14.
//

import UIKit
import PhotosUI

import RxSwift
import RxCocoa

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

protocol profileImageChangeDelegate: AnyObject {
    func changeProfileImage(image: UIImage)
}

class EditProfileImageViewController: BaseViewController{
    
    private let editProfileImageView = EditProfileImageView()
    private let disposeBag = DisposeBag()
    weak var delegate: profileImageChangeDelegate?
    
    override func loadView() {
        self.view = editProfileImageView
    }
    
    override func bind() {
        editProfileImageView.albumButton.rx.tap
            .asDriver()
            .drive(with: self) { owner, _ in
                owner.presentPickerView()
            }
            .disposed(by: disposeBag)
        editProfileImageView.normalButton.rx.tap
            .asDriver()
            .drive(with: self) { owner, _ in
                owner.delegate?.changeProfileImage(image: Image.profileNormal)
                owner.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    
    func presentPickerView(){
        var configuration = PHPickerConfiguration()
        configuration.filter = .any(of: [.images])
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }


}

extension EditProfileImageViewController: PHPickerViewControllerDelegate{
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        let itemProvider = results.first?.itemProvider
        if let itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) {[weak self] image, error in
                if let image = image as? UIImage {
                    DispatchQueue.main.async {
                        self?.delegate?.changeProfileImage(image: image)
                        self?.dismiss(animated: true)
                    }
                }
            }
        }
    }
    
}
