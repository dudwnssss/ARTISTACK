//
//  ProfileViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/10/24.
//

import Foundation

class ProfileViewModel {
    
    var myProfileData: Observable<UserData?> = Observable(nil)
    var projectList: Observable<[Project]> = Observable([])
    var projectCount: Observable<Int> = Observable(0)
    
    init(){
        fetchMyProfile()
        fetchMyProject()
    }
}

extension ProfileViewModel {
    func fetchMyProfile(){
        Network.shared.request(type: MyProfileResponse.self, api: UsersTarget.myProfile) { response in
            switch response {
            case .success(let success):
                self.myProfileData.value = success.data
            case .failure(let failure):
                debugPrint(failure)
            }
        }
    }
    
    func fetchMyProject(){
        Network.shared.request(type: ProjectResponse.self, api: ProjectsTarget.myProject) { response in
            switch response {
            case .success(let success):
                self.projectList.value = success.data.content
                self.projectCount.value = success.data.content.count
            case .failure(let _):
                debugPrint(response)
            }
        }
    }
}
