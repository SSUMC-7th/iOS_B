//
//  UserTargetType.swift
//  Kream
//
//  Created by 한금준 on 11/20/24.
//

import Foundation
import Moya

enum UserSearchType {
    case search(query: String)
}

extension UserSearchType: TargetType {
    var baseURL: URL {
            guard let baseURL = URL(string: "https://dummyjson.com") else {
                fatalError("Error: Invalid URL")
            }
            
            return baseURL
        }
    
    var path: String {
        switch self {
        case .search:
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
            switch self {
            case .search:
                return .get
            }
        }
    
    var task: Moya.Task {
            switch self {
            case .search(let query):
                return .requestParameters(parameters: ["q": query], encoding: URLEncoding.queryString)
            }
        }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
