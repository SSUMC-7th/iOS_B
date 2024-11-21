//
//  APIClient.swift
//  Week7_Mission
//
//  Created by LEE on 2024/11/15.
//

import Foundation
import Alamofire

final class APIClient {
    static let shared = APIClient()
    
    private let session: Session
    
    private init() {
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String
        let interceptor = AuthorizationInterceptor(kakaoKey: apiKey)
        session = Session(interceptor: interceptor)
    }
    
    public func request<T: Codable>(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        completion: @escaping (Result<T, Error>) -> Void) {
            session.request(url, method: method, parameters: parameters)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            
        }
}