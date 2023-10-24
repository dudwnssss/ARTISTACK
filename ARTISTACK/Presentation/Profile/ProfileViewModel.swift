//
//  ProfileViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/10/24.
//

import Foundation

class ProfileViewModel {
    
    var myProfileData: Observable<UserData?> = Observable(nil)
    
    init(){
        fetchMyProfile()
    }
}

extension ProfileViewModel {
    
    func fetchMyProfile(){
        Network.shared.request(type: MyProfileResponse.self, api: UsersTarget.myProfile) { response in
            switch response {
            case .success(let success):
                self.myProfileData.value = success.data
            case .failure(let failure):
                debugPrint(response)
            }
        }
    }
}
