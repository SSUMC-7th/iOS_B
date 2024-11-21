//
//  RecommendItemModel.swift
//  Week8_Mission
//
//  Created by LEE on 2024/11/22.
//

import Foundation

struct RecommendationItemModel{
    let title : String
    
}

final class dummyRecommendItemModel {
    static let recommendItemModelDatas : [RecommendationItemModel] = [
        RecommendationItemModel(title: "채원 슈프림 후리스"),
        RecommendationItemModel(title: "나이키V2K런"),
        RecommendationItemModel(title: "뉴발란드996"),
        RecommendationItemModel(title: "신상 나이키 콜라보"),
        RecommendationItemModel(title: "허그 FW 패딩"),
        RecommendationItemModel(title: "벨루어 눕시"),
    ]

}
