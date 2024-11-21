//
//  MoyaSettings.swift
//  Week8_Mission
//
//  Created by LEE on 2024/11/22.
//

import Foundation
import Moya

enum SearchTargetType{
    case searchItems(keyword: String)
}

extension SearchTargetType: TargetType{
    
    var baseURL: URL {
        
        guard let baseURL = URL(string: "https://dummyjson.com") else {
            fatalError("Error : Invalid BaseURL")
        }
        
        return baseURL
    }
    
    var path: String {
        switch self {
        case .searchItems :
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchItems :
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self{
        case let .searchItems(keyword) :
            return .requestParameters(parameters: ["q": keyword], encoding: URLEncoding.default
            )
        }
    }
    
    var headers: [String : String]? {
        switch self{
        case .searchItems(let keyWord) :
            return ["Content-Type" : "application/json"]
        }
    }
    
}

struct SearchResponseModel : Codable{
    let products : [SearchItemModel]
    let total : Int
    let skip : Int
    let limit : Int
}

struct SearchItemModel : Codable{
    let id: Int
    let title: String
}
