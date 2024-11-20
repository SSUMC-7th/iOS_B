//
//  ProductModel.swift
//  Kream_demo
//
//  Created by 황상환 on 11/1/24.
//

import Foundation
import UIKit

struct ProductModel {
    let image: UIImage?
    let tradeCount: String
    let brand: String
    let name: String
    let price: String
}

extension ProductModel {
    static func dummy() -> [ProductModel] {
        return [
            ProductModel(
                image: UIImage(named: "JustDrop_1"),
                tradeCount: "12.8만",
                brand: "MLB",
                name: "청키라이너 뉴욕양키스",
                price: "139,000원"
            ),
            ProductModel(
                image: UIImage(named: "JustDrop_2"),
                tradeCount: "15.6만",
                brand: "Jordan",
                name: "Jordan 1 Retro High OG Yellow Ochre",
                price: "228,000원"
            ),
            ProductModel(
                image: UIImage(named: "JustDrop_3"),
                tradeCount: "2.0만",
                brand: "Human Made",
                name: "Varsity Jacket",
                price: "2,000,000원"
            )
        ]
    }
}
