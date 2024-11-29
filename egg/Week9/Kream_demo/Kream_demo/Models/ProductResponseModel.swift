//
//  SearchProduct.swift
//  Kream_demo
//
//  Created by 황상환 on 11/20/24.
//

import Foundation
import Moya
import UIKit

struct SearchResponse: Codable {
    let products: [ProductResponseModel]
    let total: Int
    let skip: Int
    let limit: Int
}

struct ProductResponseModel: Codable {
    let id: Int
    let title: String
}
