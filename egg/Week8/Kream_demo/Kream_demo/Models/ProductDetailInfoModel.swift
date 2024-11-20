//
//  ProductDetailInfoModel.swift
//  Kream_demo
//
//  Created by 황상환 on 11/7/24.
//

import Foundation
import UIKit

struct ProductDetailInfoModel {
    let image: UIImage?
}

extension ProductDetailInfoModel {
    static func dummy() -> [ProductDetailInfoModel] {
        return [
        ProductDetailInfoModel(image: UIImage(named: "sub_1")),
        ProductDetailInfoModel(image: UIImage(named: "sub_2")),
        ProductDetailInfoModel(image: UIImage(named: "sub_3")),
        ProductDetailInfoModel(image: UIImage(named: "sub_4")),
        ProductDetailInfoModel(image: UIImage(named: "sub_5")),
        ProductDetailInfoModel(image: UIImage(named: "sub_6")),
        ProductDetailInfoModel(image: UIImage(named: "sub_7")),
        
        ]
    }
}
