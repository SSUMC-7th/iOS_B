//
//  ItemModel.swift
//  Week5_Mission
//
//  Created by LEE on 2024/10/31.
//

import Foundation

struct ItemModel{
    let image: String
    let title: String
    let subTitle: String
    let price: String
}

final class dummyItemModel{
    static let ItemModelDatas: [ItemModel] = [
        ItemModel(image: "MLB 청키라이너.png", title: "MLB", subTitle: "청키라이너 뉴욕양키스", price: "139,000원"),
        ItemModel(image: "조던 레트로.png", title: "Jordan", subTitle: "Jordan 1 Retro High OGYellow Ochre", price: "228,000원"),
        ItemModel(image: "휴먼 머시기.png", title: "Human Made", subTitle: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원"),
    ]
}
