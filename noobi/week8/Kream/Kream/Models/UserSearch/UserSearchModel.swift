//
//  UserSearchModel.swift
//  Kream
//
//  Created by 한금준 on 11/20/24.
//

import Foundation

struct UserSearchModel: Codable {
    let products: [Product]
}

struct Product: Codable {
    let id: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
    }
}
