//
//  SavedModel.swift
//  Kream
//
//  Created by 한금준 on 10/6/24.
//

import UIKit

struct SavedModel {
    let savedImage : String
    let savedName : String
    let brand: String?     // 브랜드는 Product만 사용하므로 옵셔널
    let price: String?     // 가격도 Product에만 필요하므로 옵셔널
}

extension SavedModel{
    ///  // dummy data 10개 생성
    static func savedDummyData() -> [SavedModel] {
        return [
            SavedModel(savedImage: "product1", savedName: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", brand: "손오공이 잃어버린 머리띠 반쪽", price: "942,192,000원"),
            SavedModel(savedImage: "product2", savedName: "크림 드로우", brand: nil, price: nil),
            SavedModel(savedImage: "product3", savedName: "크림 드로우", brand: nil, price: nil),
            SavedModel(savedImage: "product4", savedName: "크림 드로우", brand: nil, price: nil),
            SavedModel(savedImage: "product5", savedName: "크림 드로우", brand: nil, price: nil),
            SavedModel(savedImage: "product6", savedName: "크림 드로우", brand: nil, price: nil),
            SavedModel(savedImage: "product7", savedName: "크림 드로우", brand: nil, price: nil),
            SavedModel(savedImage: "product8", savedName: "크림 드로우", brand: nil, price: nil),
            SavedModel(savedImage: "product9", savedName: "크림 드로우", brand: nil, price: nil),
            SavedModel(savedImage: "product10", savedName: "크림 드로우", brand: nil, price: nil),
        ]
    }
}
