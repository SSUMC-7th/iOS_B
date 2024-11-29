//
//  ProductDetail.swift
//  Kream
//
//  Created by 한금준 on 11/4/24.
//

import UIKit

struct ProductDetailModel {
    let clothesImage: UIImage
}

extension ProductDetailModel{
    ///  ProductDetailView에 들어갈 dummy 데이터 7개를 추가
    static func clothesDummyData() -> [ProductDetailModel] {
        return [
            ProductDetailModel(clothesImage: .clothes2),
            ProductDetailModel(clothesImage: .clothes3),
            ProductDetailModel(clothesImage: .clothes4),
            ProductDetailModel(clothesImage: .clothes5),
            ProductDetailModel(clothesImage: .clothes6),
            ProductDetailModel(clothesImage: .clothes7),
            ProductDetailModel(clothesImage: .clothes8)
        ]
    }
}
