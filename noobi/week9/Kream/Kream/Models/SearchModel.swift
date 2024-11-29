//
//  SearchModel.swift
//  Kream
//
//  Created by 한금준 on 11/19/24.
//

import Foundation

struct SearchModel {
    let suggest: String
}

extension SearchModel{
    ///  SearchCollectionView에 들어갈 dummy 데이터 6개를 추가
    static func searchDummyData() -> [SearchModel] {
        return [
            SearchModel(suggest: "채원 슈프림 후리스"),
            SearchModel(suggest: "나이키V2컨"),
            SearchModel(suggest: "뉴발란드996"),
            SearchModel(suggest: "신상 나이키 콜라보"),
            SearchModel(suggest: "허그 FW 패딩"),
            SearchModel(suggest: "벨루어 눕시")
        ]
    }
}
