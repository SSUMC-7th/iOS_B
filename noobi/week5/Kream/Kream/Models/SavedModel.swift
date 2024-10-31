//
//  SavedModel.swift
//  Kream
//
//  Created by 한금준 on 10/6/24.
//

import UIKit

struct SavedModel {
    let savedImage : String
    let brand: String?
    let describe : String
    let price: String?
}

extension SavedModel{
    ///  // dummy data 10개 생성
    static func savedDummyData() -> [SavedModel] {
        return [
            SavedModel(savedImage: "product1", brand: "손오공이 잃어버린 머리띠 반쪽", describe: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", price: "942,192,000원"),
            SavedModel(savedImage: "product2", brand: "골드 반지",describe: "결혼 준비하는 당신?! 약혼녀에게 이 반지를 선물하는 건 어때요?!", price: "12,000원"),
            SavedModel(savedImage: "product3", brand: "하얀 신발", describe: "짝퉁 나이키 신발! 정말 푹신푹신해서 걷다가 졸려서 넘어지", price: "90,000원"),
            SavedModel(savedImage: "product4", brand: "에베레스트 다이아 반지", describe: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈것인가??", price: "1,292,999,000원"),
            SavedModel(savedImage: "product5", brand: "아디다스다 신발", describe: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~", price: "120,000원"),
            SavedModel(savedImage: "product6", brand: "황제 잠옷", describe: "어느 나라의 황제가 입었다던 잠옷 크리스마스 트리같이 보이는 디자인!", price: "120,000,000원"),
            SavedModel(savedImage: "product7", brand: "고장난 기타", describe: "블라블라블라블라 블라블라블라블라블라", price: "120,000원"),
            SavedModel(savedImage: "product8", brand: "손오공이 잃어버린 머리띠 반쪽", describe: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", price: "942,192,000원"),
            SavedModel(savedImage: "product9", brand: "골드 반지", describe: "결혼 준비하는 당신?! 약혼녀에게 이 반지를 선물하는 건 어때요?!", price: "12,000원"),
            SavedModel(savedImage: "product10", brand: "하얀 신발", describe: "짝퉁 나이키 신발! 정말 푹신푹신해서 걷다가 졸려서 넘어지", price: "90,000원"),
        ]
    }
}
