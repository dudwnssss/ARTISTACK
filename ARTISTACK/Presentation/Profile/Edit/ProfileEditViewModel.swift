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
    
    //Input
    let nickname = PublishRelay<String>()
    let description = PublishRelay<String?>()
    let tapCompleteButton = PublishRelay<Void>()
    
    
    //Output
    let validation = BehaviorRelay<Bool>(value: false)
    let updateSuccess = PublishRelay<Void>()
    let nicknameOutput = PublishRelay<String>()
    let descriptionOutput = PublishRelay<String?>()
    
    var disposeBag = DisposeBag()
    
    init(){
        bind()
    }

}

extension ProfileEditViewModel {
    
    func bind() {
        let nickAndDescription = Observable.combineLatest(nickname, description)
        
        nickAndDescription
            .map({ nickname, description in
                nickname.count > 4
            })
            .bind(to: validation)
            .disposed(by: disposeBag)
        
        tapCompleteButton
            .withLatestFrom(nickAndDescription)
            .bind(with: self, onNext: { owner, tuple in
                owner.updateProfile(nickname: tuple.0, description: tuple.1)
            })
            .disposed(by: disposeBag)
        
        nickname
            .bind(to: nicknameOutput)
            .disposed(by: disposeBag)
        
        description
            .bind(to: descriptionOutput)
            .disposed(by: disposeBag)
    }
    
    
    func updateProfile(nickname: String, description: String?){
        let request = EditProfileRequest(nickname: nickname,description: description)
        Network.shared.request(type: MyProfileResponse.self, api: UsersTarget.editProfile(request)) { [weak self] response in
            switch response{
            case .success(_):
                self?.updateSuccess.accept(())
            case .failure(_):
                debugPrint(response)
            }
        }
    }
    
}
