//
//  WinterItemModel.swift
//  Week5_Mission
//
//  Created by LEE on 2024/10/31.
//

import Foundation

struct WinterItemModel{
    let image: String
}

final class dummyWinterItemModel{
    static let WinterItemModelDatas: [WinterItemModel] = [
        WinterItemModel(image: "모델1.png"),
        WinterItemModel(image: "모델2.png"),
        WinterItemModel(image: "모델3.png")
    ]
}
