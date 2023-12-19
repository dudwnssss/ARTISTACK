//
//  Network.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import Foundation
import Alamofire
import RxSwift

class API {
    static let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        let apiLogger = APIEventLogger()
        return Session(configuration: configuration, eventMonitors: [apiLogger])
    }()
}

final class NetworkManager{
    
    static let shared = NetworkManager()
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
    
    func request<T: Decodable>(type: T.Type, api: TargetType) -> Single<Result<T, Error>> {
        return Single.create { single -> Disposable in
            API.session.request(api).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    single(.success(.success(data)))
                case .failure(let error):
                    single(.success(.failure(error)))
                }
            }
            return Disposables.create()
        }
    }
    
    func upload<T: Decodable>(type: T.Type, api: TargetType) -> Single<Result<T, Error>> {
        return Single.create { single -> Disposable in
            API.session.upload(multipartFormData: api.multipart, with: api).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    single(.success(.success(data)))
                case .failure(let error):
                    single(.success(.failure(error)))
                }
            }
            return Disposables.create()
        }
    }
    
}
