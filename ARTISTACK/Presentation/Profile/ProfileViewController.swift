//
//  ProfileViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit
import PhotosUI


class ProfileViewController: BaseViewController {
    
    let profileView = ProfileView()
    let viewModel = ProfileViewModel()
    
    override func loadView() {
        self.view = profileView
    }
    
    override func bind() {
        viewModel.myProfileData.bind { [weak self] _ in
            self?.profileView.projectCollectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    override func setProperties() {
        profileView.projectCollectionView.dataSource = self
        profileView.projectCollectionView.delegate = self
    }
    
    override func setNavigationBar(){
        let barButtonItem = CustomBarButtonItem().then{
            $0.titleLabel.text = "프로필"
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Image.setting, style: .plain, target: self, action: #selector(settingButtonDidTap))
        navigationItem.rightBarButtonItem?.tintColor = Color.artistackSystem6
    }
    
    
    @objc func profileEditButtonDidTap(profileImage: String?, nickname: String?, description: String?){
        let vc = ProfileEditViewController()
        if let profileImage {
            print("이미지 넣기")
        }
        if let nickname {
            vc.profileEditView.nicknameTextFieldView.textField.text = nickname
        }
        if let description {
            vc.profileEditView.descriptionTextView.textView.text = description
        }
        
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
        vc.hidesBottomBarWhenPushed = false
    }
    
    @objc func settingButtonDidTap(){
        let vc = SettingViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProfileViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let profileCell: ProfileCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            if let data = viewModel.myProfileData.value {
                profileCell.configureCell(profile: data)
                profileCell.buttonAction = { [weak self] in
                    self?.profileEditButtonDidTap(profileImage: data.profileImgURL, nickname: data.nickname, description: data.description)
                    self?.viewModel.myProfileData.value = data
                }
            }
            return profileCell
        } else if indexPath.section == 1 {
            let projectCell: ProjectCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            return projectCell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 1 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProjectHeaderView.reuseIdentifier, for: indexPath) as!
            ProjectHeaderView
            return header
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let vc = HomeViewController()
            //            vc.homeView.headerLabel.isHidden = true
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
