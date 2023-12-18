//
//  ProfileViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit
import PhotosUI
import RxSwift
import RxCocoa
import RxDataSources

class ProfileViewController: BaseViewController {
    
    let disposeBag = DisposeBag()
    let profileView = ProfileView()
    let viewModel = ProfileViewModel()
    var header: ProjectHeaderView?
    
    
    override func loadView() {
        self.view = profileView
    }
    
    override func bind() {
        viewModel.sections
            .bind(to: profileView.projectCollectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    lazy var dataSource = setDataSource()
    
    override func setProperties() {
        self.dataSource.configureSupplementaryView = { datasource, collectionView, kind, indexPath in
            switch datasource.sectionModels[indexPath.section] {
            case .profileSection(_):
                return UICollectionReusableView()
            case .projectSection(let count, _):
                let header: ProjectHeaderView = collectionView.dequeueHeaderView(forIndexPath: indexPath)
                header.configureHeader(count: count)
                return header
            }
        }
    }
    
    override func setNavigationBar(){
        let barButtonItem = CustomBarButtonItem().then{
            $0.titleLabel.text = "프로필"
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonItem)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Image.setting, style: .plain, target: self, action: #selector(settingButtonDidTap))
        navigationItem.rightBarButtonItem?.tintColor = Color.artistackSystem6
    }
    
    @objc func settingButtonDidTap(){
        let vc = SettingViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProfileViewController {
    func setDataSource() -> RxCollectionViewSectionedReloadDataSource<MultipleSectionModel> {
        return RxCollectionViewSectionedReloadDataSource<MultipleSectionModel> { dataSource, collectionView, indexPath, _ in
            switch dataSource[indexPath] {
            case .profileItem(let data):
                let cell: ProfileCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
                cell.profileEditButton.rx.tap
                    .bind(with: self) { owner, _ in
                        let vm = ProfileEditViewModel(userdata: owner.viewModel.profile!)
                        let vc = ProfileEditViewController(viewModel: vm)
                        vc.delegate = self
                        vc.hidesBottomBarWhenPushed = true
                        owner.navigationController?.pushViewController(vc, animated: true)
                        
                    }
                    .disposed(by: cell.disposeBag)
                cell.configureCell(profile: data)
                return cell
            case .projectItem(let data):
                let cell: ProjectCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
                cell.configureCell(project: data)
                return cell
            }
        }
    }
}

extension ProfileViewController {
    private func pushEditProfileViewController(userData: UserData) {
        let vm = ProfileEditViewModel(userdata: userData)
        let vc = ProfileEditViewController(viewModel: vm)
        vc.delegate = self
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProfileViewController: ProfileEditDelegate {
    func profileDidEdit(userData: UserData) {
        viewModel.updateProfile(data: userData)
    }
}

enum MultipleSectionModel {
    case profileSection(items: [SectionItem])
    case projectSection(count: Int, items: [SectionItem])
}

enum SectionItem {
    case profileItem(data: UserData)
    case projectItem(data: Project)
}

extension MultipleSectionModel: SectionModelType {
    typealias Item = SectionItem
    
    var items: [SectionItem] {
        switch self {
        case .profileSection(let items):
            return items.map { $0 }
        case .projectSection(_, let items):
            return items.map { $0 }
        }
    }
    
    init(original: MultipleSectionModel, items: [SectionItem]) {
        switch original {
        case .profileSection(let items):
            self = .profileSection(items: items)
        case .projectSection(let count, let items):
            self = .projectSection(count: count, items: items)
        }
    }
}
