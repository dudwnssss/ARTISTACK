//
//  ProfileEditViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/25.
//

import Foundation

class ProfileEditViewModel{
    var nicknameText: Observable<String?> = Observable(nil)
    var descriptionText: Observable<String?> = Observable(nil)
    var profileData: Observable<UserData?> = Observable(nil)
    
}

extension ProfileEditViewModel {
    

    func updateProfile(){
        let nickname = nicknameText.value
        let description = descriptionText.value
        let request = EditProfileRequest(nickname: nickname,description: description)
        Network.shared.request(type: UserData.self, api: UsersTarget.editProfile(request)) { response in
            switch response{
            case .success(let success):
                debugPrint(response)
            case .failure(_):
                debugPrint(response)
            }
        }
    }
}
