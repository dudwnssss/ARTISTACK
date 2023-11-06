//
//  ProfileEditViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/25.
//

import Foundation
import RxSwift
import RxCocoa

class ProfileEditViewModel: ViewModel{


    struct Input {
        let nickname: ControlProperty<String>
        let description: ControlProperty<String?>
        let tap: ControlEvent<Void>
    }
    
    struct Output {
        let validation: Observable<Bool>
        let nickname: Observable<String>
        let description: Observable<String?>
        let edit: PublishSubject<Void>
    }
    
    func transform(input: Input) -> Output {
        let inputInfo = Observable.combineLatest(nickname, description)
        
        let validation = inputInfo
            .map { $0.0.count >= 4 }
        
        return Output(validation: validation, nickname: input.nickname.asObservable(), description: input.description.asObservable(), edit: <#T##PublishSubject<Void>#>)
        
    }
    
    
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
            .bind(with: self, onNext: { owner, data in
                owner.editProfile(nickname: data.0, description: data.1)
            })
            .disposed(by: disposeBag)
        
        nickname
            .bind(to: nicknameOutput)
            .disposed(by: disposeBag)
        
        description
            .bind(to: descriptionOutput)
            .disposed(by: disposeBag)
    }
    
    
    func editProfile(nickname: String, description: String?){
        let request = EditProfileRequest(nickname: nickname,description: description)
        
        let result = Network.shared.requestRx(type: MyProfileResponse.self, api: UsersTarget.editProfile(request))
    }
    
    //Single
    
}
