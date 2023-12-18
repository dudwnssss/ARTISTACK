//
//  ProfileViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/10/24.
//

import Foundation
import RxSwift
import RxCocoa

class ProfileViewModel {
    
    let disposeBag = DisposeBag()
        
    var profileSection = PublishRelay<MultipleSectionModel>()
    var projectSection = PublishRelay<MultipleSectionModel>()
    var projectCount: CustomObservable<Int> = CustomObservable(0)
    
    var sections = BehaviorRelay<[MultipleSectionModel]>(value: [])
    
    var profile: UserData?
    
    init(){
        fetchMyProfile()
        fetchMyProject()
        bind()
    }
}

extension ProfileViewModel {

    func bind() {
        Observable.combineLatest(profileSection, projectSection)
            .map { [$0.0, $0.1] }
            .bind(to: sections)
            .disposed(by: disposeBag)
    }
    
    func updateProfile(data: UserData) {
        profileSection.accept(MultipleSectionModel.profileSection(items: [.profileItem(data: data)]))
    }
    
    
    func fetchMyProfile() {
        Network.shared.request(type: MyProfileResponse.self, api: UsersTarget.myProfile) { response in
            switch response {
            case .success(let success):
                self.profile = success.data
                self.profileSection.accept(MultipleSectionModel.profileSection(items: [.profileItem(data: success.data)]))
            case .failure(let failure):
                debugPrint(failure)
            }
        }
    }
    
    func fetchMyProject() {
        Network.shared.request(type: ProjectResponse.self, api: ProjectsTarget.myProject) { response in
            switch response {
            case .success(let success):
                let items = success.data.content.map { SectionItem.projectItem(data: $0) }
                self.projectSection.accept(MultipleSectionModel.projectSection(count: items.count, items: items))
            case .failure(_):
                debugPrint(response)
            }
        }
    }
}
