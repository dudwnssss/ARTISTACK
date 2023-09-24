//
//  ProfileViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit
import PhotosUI


class ProfileViewController: BaseViewController {

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
        navigationItem.rightBarButtonItem?.tintColor = .artistackSystem6
    }
    
    @objc func profileEditButtonDidTap(){
        let vc = ProfileEditViewController()
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
            profileCell.buttonAction = { [weak self] in
                self?.profileEditButtonDidTap()
            }
            
            Network.shared.request(type: MyProfileResponse.self, api: UsersTarget.myProfile) { response in
                switch response {
                case .success(let success):
                    profileCell.configureCell(profile: success.data)
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
