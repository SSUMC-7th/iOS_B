//
//  CategoryModel.swift
//  Week4_Mission
//
//  Created by LEE on 2024/10/11.
//

import Foundation


struct CategoryModel{
    let title: String
    let image: String
}

final class dummyCategoryModel{
    static let CategoryModelDatas: [CategoryModel] = [
        CategoryModel(title: "크림 드로우", image: "크림 드로우.png"),
        CategoryModel(title: "실시간 차트", image: "실시간 차트.png"),
        CategoryModel(title: "남성 추천", image: "남성 추천.png"),
        CategoryModel(title: "여성 추천", image: "여성 추천.png"),
        CategoryModel(title: "색다른 추천", image: "색다른 추천.png"),
        CategoryModel(title: "정가 아래", image: "정가 아래.png"),
        CategoryModel(title: "윤세 24AW", image: "윤세 24AW.png"),
        CategoryModel(title: "올해의 베스트", image: "올해의 베스트.png"),
        CategoryModel(title: "10월 베네핏", image: "10월 베네핏.png"),
        CategoryModel(title: "아크네 선물", image: "아크네 선물.png"),
    ]
}
