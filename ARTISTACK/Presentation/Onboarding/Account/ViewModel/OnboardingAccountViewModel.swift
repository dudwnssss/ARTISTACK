//
//  OnboardingAccountViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import Foundation

import RxSwift
import RxCocoa

class OnboardingAccountViewModel: ViewModelType {
    var idText: CustomObservable<String?> = CustomObservable(nil)
    var constaintText: CustomObservable<String?> = CustomObservable("영문 소문자, 숫자, 밑줄기호 입력 가능 (총 4-17자)")
    var isValid = CustomObservable(false)
    var isDuplicated = CustomObservable(true)
    private let disposeBag = DisposeBag()
    
    struct Input {
        let idText: Observable<String>
    }
    
    struct Output {
        let idText = PublishSubject<String>()
    }
    
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.idText
            .map { $0.lowercased() }
            .bind(to: output.idText)
            .disposed(by: disposeBag)
        
        return output
    }
    
    

    
    func checkValidate() {
        // 입력이 4-17자 사이인지 확인
        guard let idText = idText.value else {return}
        guard (4...17).contains(idText.count) else {
            constaintText.value = "1-17자 사이로 입력해주세요"
            isValid.value = false
            return
        }
        
        // 입력이 영문 소문자, 숫자, 밑줄 기호로만 이루어져 있는지 확인
        let allowedCharacterSet = CharacterSet.lowercaseLetters.union(CharacterSet.decimalDigits).union(CharacterSet(charactersIn: "_"))
        guard idText.rangeOfCharacter(from: allowedCharacterSet.inverted) == nil else {
            constaintText.value = "영문 소문자, 숫자, 밑줄기호 입력 가능 (총 4-17자)"
            isValid.value = false
            return
        }
        constaintText.value = "영문 소문자, 숫자, 밑줄기호 입력 가능 (총 4-17자)"
        isValid.value = true
        return
    }
    
    func checkDuplicate(){
        guard let idText = idText.value else {return}
        let request = DuplicateRequest(value: idText)
        NetworkManager.shared.request(type: DuplicateResponse.self, api: UsersTarget.duplicate(request)) { response in
            switch response {
            case .success(let success):
                switch success.data{
                case true:
                    self.constaintText.value = "영문 소문자, 숫자, 밑줄기호 입력 가능 (총 4-17자)"
                    self.isDuplicated.value = false
                case false:
                    self.self.constaintText.value = "중복된 닉네임입니다."
                    self.isDuplicated.value = true
                }
            case .failure(let failure):
                debugPrint(response)
            }
        }
    }
}
