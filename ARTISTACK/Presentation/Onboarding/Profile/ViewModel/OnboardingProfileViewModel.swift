//
//  OnboardingProfileViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/12/19.
//

import Foundation

import RxSwift
import RxCocoa

class OnboardingProfileViewModel: ViewModelType {
    private let disposeBag = DisposeBag()
    private let profileSuccessTrigger = BehaviorRelay<String?>(value: nil)

    
    struct Input {
        let profileImageDidSet: Observable<Data>
        let nextButtonDidTap: Observable<Void>
        let description: Observable<String>
    }
    
    struct Output {
        let pushToNextVC = PublishRelay<Void>()
    }
    
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.profileImageDidSet
            .debug()
            .bind(with: self) { owner, data in
                owner.uploadProfileImage(imageData: data)
            }
            .disposed(by: disposeBag)
        
        input.nextButtonDidTap
            .withLatestFrom(input.description)
            .bind(with: self) { owner, description in
                if description != Const.profileDescription {
                    UserDefaults.standard.setValue(description, forKey: "description")
                }
                if let urlString = owner.profileSuccessTrigger.value {
                    UserDefaults.standard.setValue(urlString, forKey: "profileImgUrl")
                }
                output.pushToNextVC.accept(())
            }
            .disposed(by: disposeBag)
        
        return output
    }
}

extension OnboardingProfileViewModel {
    func uploadProfileImage(imageData: Data) {
        let request = UploadRequest(multiple: "false")
        NetworkManager.shared.upload(type: UploadResponse.self, api: UploadTarget.profile(imageData: imageData, request: request))
            .subscribe(with: self) { owner, response in
                switch response {
                case .success(let value):
                    owner.profileSuccessTrigger.accept(value.data)
                    //TODO:  프로필 사진 제대로 안왔을 경우 예외처리
                case .failure(_):
                    debugPrint(response)
                }
            }
            .disposed(by: disposeBag)
    }
}
