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
    private let profileSuccessTrigger = PublishSubject<String?>()
    
    init(userdata: UserData) {
        self.userdata = userdata
    }
    
    struct Input {
        let nickname: Observable<String>
        let description: Observable<String>
        let storeButtonDidTap: Observable<Void>
        let profileImage: Observable<Data>
    }
    
    struct Output {
        let nickname = BehaviorRelay<String>(value: "")
        let description = BehaviorRelay<String>(value: "")
        let profileImage = BehaviorRelay<String?>(value: nil)
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
            .withLatestFrom(input.profileImage.startWith(Data()))
            .debug("뭐여")
            .subscribe(with: self) { owner, imageData in
                owner.uploadProfileImage(imageData: imageData)
            }
            .disposed(by: disposeBag)
        
        profileSuccessTrigger
            .bind(with: self) { owner, urlString in
                print("urlstring", urlString)
                owner.updateProfile(nickname: output.nickname.value, description: output.description.value, imageData: urlString)
            }
            .disposed(by: disposeBag)
        editSuccessTrigger
            .bind(to: output.editComplete)
            .disposed(by: disposeBag)
        
        output.profileImage.accept(userdata.profileImgUrl)
        output.nickname.accept(userdata.nickname)
        output.description.accept(userdata.description!)
    
        return output
    }

}

extension ProfileEditViewModel {
    
    func uploadProfileImage(imageData: Data) {
        let request = UploadRequest(multiple: "false")
        NetworkManager.shared.upload(type: UploadResponse.self, api: UploadTarget.profile(imageData: imageData, request: request))
            .subscribe(with: self) { owner, response in
                switch response {
                case .success(let value):
                    owner.profileSuccessTrigger.onNext(value.data)
                case .failure(_):
                    debugPrint(response)
                }
            }
            .disposed(by: disposeBag)
    }
    
    func updateProfile(nickname: String?, description: String?, imageData: String?) {
        let request = EditProfileRequest(nickname: nickname, description: description, profileImgUrl: imageData)
        NetworkManager.shared.request(type: MyProfileResponse.self, api: UsersTarget.editProfile(request))
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
