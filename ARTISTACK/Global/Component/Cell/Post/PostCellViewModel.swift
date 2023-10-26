//
//  PostCellViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/10/25.
//

import Foundation
import RxSwift
import RxCocoa

class PostCellViewModel {
    
    var data: Project?
}

extension PostCellViewModel {
    
    func like(){
        guard let data else {return}
        Network.shared.request(type: LikeResponse.self, api: ProjectsTarget.like(projectId: data.id)) { result in
            switch result {
            case .success(_):
                print("success")
            case .failure(_):
                debugPrint(result)
            }
        }
    }
    
    func cancelLike(){
        guard let data else {return}
        Network.shared.request(type: LikeResponse.self, api: ProjectsTarget.like(projectId: data.id)) { result in
            switch result {
            case .success(_):
                print("success")
            case .failure(_):
                debugPrint(result)
            }
        }
    }
}
