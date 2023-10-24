//
//  HomeViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/10/23.
//

import Foundation

class HomeViewModel {
    
    var projectList: Observable<[Project]> = Observable([])
    
    init(){
        fetchProjectList()
    }
}

extension HomeViewModel {
    
    func fetchProjectList(){
        Network.shared.request(type: ProjectResponse.self, api: ProjectsTarget.projectList) { response in
            switch response {
            case .success(let success):
                self.projectList.value = success.data.content
            case .failure(let _):
                debugPrint(response)
            }
        }
    }
    
}
