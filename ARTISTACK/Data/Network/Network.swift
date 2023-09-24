//
//  Network.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import Foundation
import Alamofire

class Network{
    
    static let shared = Network()
    private init() {}
    
    func request<T: Decodable>(type: T.Type, api: TargetType, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(api).responseDecodable(of: T.self) { response in
            switch response.result{
            case .success(let data): completion(.success(data))
            case .failure(_):
                    debugPrint(response)
            }
        }
    }
}
