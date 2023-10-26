//
//  ProfileEditViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/25.
//

import Foundation
import RxSwift
import RxCocoa

class ProfileEditViewModel{
    
    let input = Input()
    let output = Output()
    
    struct Input {
        var nickname = BehaviorRelay<String>(value: "")
        var description = BehaviorRelay<String>(value: "")
        var completeButtonDidTap = PublishSubject<Void>()
    }
    
    struct Output {
        let userDataFinishedTrigger = PublishRelay<Void>()
    }
    
    var profileData: CustomObservable<UserData?> = CustomObservable(nil)
}

extension ProfileEditViewModel {
    
    func bind(){
        
    }

    func updateProfile(){
        let nickname = input.nickname.value
        let description = input.description.value
        let request = EditProfileRequest(nickname: nickname,description: description)
        Network.shared.request(type: UserData.self, api: UsersTarget.editProfile(request)) { response in
            switch response{
            case .success(let success):
                debugPrint(response)
                self.output.userDataFinishedTrigger.accept(())
            case .failure(_):
                debugPrint(response)
            }
        }
    }
}
