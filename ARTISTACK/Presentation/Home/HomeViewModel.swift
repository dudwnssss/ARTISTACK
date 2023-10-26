//
//  HomeViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/10/23.
//

import Foundation
import RxCocoa
import RxSwift

class HomeViewModel {
    
    var projectList: CustomObservable<[Project]> = CustomObservable([])
    let cellLikeButtonTapped = PublishRelay<Void>()
    
    var disposeBag = DisposeBag()
        
    init(){
        bind()
        fetchProjectList()
    }
}

extension HomeViewModel {
    
    func fetchProjectList(){
        Network.shared.request(type: ProjectResponse.self, api: ProjectsTarget.projectList) { response in
            switch response {
            case .success(let success):
                self.projectList.value = success.data.content
            case .failure(_):
                debugPrint(response)
            }
        }
    }
    
}

extension HomeViewModel {
    private func bind() {
        cellLikeButtonTapped
            .bind { [weak self] _ in
                guard let self else { return }
                //네트워크 통신
            }
            .disposed(by: disposeBag)
    }
}
