//
//  ProfileEditViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/25.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag {get set}
    func transform(input: Input) -> Output
}

class ProfileEditViewModel: ViewModel{
    
    struct Input {
        let nickname: ControlProperty<String?>
        let description: ControlProperty<String?>
        let tapCompleteButton: ControlEvent<Void>
    }
    
    struct Output {
        let validation: Observable<Bool>
    }
    
    var disposeBag = DisposeBag()

    func transform(input: Input) -> Output {
        let valid = input.nickname
            .orEmpty
            .map { $0.count >= 4 }
        
        input.tapCompleteButton.bind { _ in
            print("hihi")
        }.disposed(by: disposeBag)
        
        
        return Output(validation: valid)
    }
    
}

extension ProfileEditViewModel {
    
    func updateProfile(nickname: String, description: String){
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
