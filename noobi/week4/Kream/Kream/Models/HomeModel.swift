//
//  HomeModel.swift
//  Kream
//
//  Created by 한금준 on 10/9/24.
//

import UIKit

struct HomeModel{
    let image: UIImage
    let name: String
}

extension HomeModel{
    ///  HomeCollectionView에 들어갈 dummy 데이터 10개를 추가
    static func dummy() -> [HomeModel] {
        return [
            HomeModel(image: .home1, name: "크림 드로우"),
            HomeModel(image: .home2, name: "실시간 차트"),
            HomeModel(image: .home3, name: "남성 추천"),
            HomeModel(image: .home4, name: "여성 추천"),
            HomeModel(image: .home5, name: "색다른 추천"),
            HomeModel(image: .home6, name: "정가 아래"),
            HomeModel(image: .home7, name: "윤세 24AW"),
            HomeModel(image: .home8, name: "올해의 베스트"),
            HomeModel(image: .home9, name: "10월 베네핏"),
            HomeModel(image: .home10, name: "아크네 선물")
        ]
    }
}
