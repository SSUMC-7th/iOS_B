//
//  HomeModel.swift
//  Kream_demo
//
//  Created by 황상환 on 10/10/24.
//

import Foundation
import UIKit

struct HomeModel {
    let image: UIImage
    let title: String
}

extension HomeModel {
    static func dummy() -> [HomeModel] {
        return [
            HomeModel(image: .kreamDraw, title: "크림 드로우"),
            HomeModel(image: .realChart, title: "실시간 차트"),
            HomeModel(image: .manReco, title: "남성 추천"),
            HomeModel(image: .womanReco, title: "여성 추천"),
            HomeModel(image: .differentReco, title: "색다른 추천"),
            HomeModel(image: .underPrice, title: "정가 아래"),
            HomeModel(image: .aw, title: "윤세 24AW"),
            HomeModel(image: .yearBest, title: "올해의 베스트"),
            HomeModel(image: .benefit10, title: "10월 베네핏"),
            HomeModel(image: .acneGift, title: "아크네 선물")
        ]
    }
}
