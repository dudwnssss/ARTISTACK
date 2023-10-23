//
//  ProfileViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit
import PhotosUI


class ProfileViewController: BaseViewController {
    
    var profile: UserData?{
        didSet{
            profileView.projectCollectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        StackButton.shared.stackType = .first
        StackButton.shared.setProperties()
    }
    
    let profileView = ProfileView()
    
    override func loadView() {
        self.view = profileView
    }
    
    let barButtonItem = CustomBarButtonItem().then{
        $0.titleLabel.text = "프로필"
    }
    
    override func setProperties() {
        setNavigationBar()
        profileView.projectCollectionView.dataSource = self
        profileView.projectCollectionView.delegate = self
    }
    
    func setNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "setting"), style: .plain, target: self, action: #selector(settingButtonDidTap))
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
            Network.shared.request(type: MyProfileResponse.self, api: UsersTarget.myProfile) { response in
                switch response {
                case .success(let success):
                    let data = success.data
//                    self.profile = data
                    profileCell.configureCell(profile: data)
                    profileCell.buttonAction = { [weak self] in
                        self?.profileEditButtonDidTap(profileImage: data.profileImgURL, nickname: data.nickname, description: data.description)
                        self?.profile = data
                    }
                case .failure(let failure):
                    debugPrint(response)
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
            vc.homeView.headerLabel.isHidden = true
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
