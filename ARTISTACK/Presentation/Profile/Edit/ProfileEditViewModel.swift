//
//  ProfileEditViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/25.
//

import Foundation
import RxSwift
import RxCocoa

class ProfileEditViewModel: ViewModelType {
    
    private let userdata: UserData
    private let disposeBag = DisposeBag()
    private let editSuccessTrigger = PublishSubject<UserData>()
    
    init(userdata: UserData) {
        self.userdata = userdata
    }
    
    struct Input {
        let nickname: Observable<String>
        let description: Observable<String>
        let storeButtonDidTap: Observable<Void>
    }
    
    struct Output {
        let nickname = BehaviorRelay<String>(value: "")
        let description = BehaviorRelay<String>(value: "")
        let editComplete = PublishRelay<UserData>()
    }
    
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.nickname
            .bind(to: output.nickname)
            .disposed(by: disposeBag)
        
        input.description
            .bind(to: output.description)
            .disposed(by: disposeBag)
        
        input.storeButtonDidTap
            .subscribe(with: self) { owner, _ in
                owner.updateProfile(nickname: output.nickname.value, description: output.description.value)
            }
            .disposed(by: disposeBag)
        
        editSuccessTrigger
            .bind(to: output.editComplete)
            .disposed(by: disposeBag)
        
        output.nickname.accept(userdata.nickname)
        output.description.accept(userdata.description!)
    
        return output
    }

}

extension ProfileEditViewModel {
    
    func updateProfile(nickname: String?, description: String?) {
        let request = EditProfileRequest(nickname: nickname, description: description)
        Network.shared.requestRx(type: MyProfileResponse.self, api: UsersTarget.editProfile(request))
            .subscribe(with: self) { owner, response in
                switch response {
                case .success(let result):
                    owner.editSuccessTrigger.onNext(result.data)
                case .failure(_):
                    debugPrint(response)
                }
            }
            .disposed(by: disposeBag)
    }
}
