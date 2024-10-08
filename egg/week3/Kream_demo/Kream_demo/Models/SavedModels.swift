//
//  SavedModels.swift
//  Kream_demo
//
//  Created by 황상환 on 10/7/24.
//

import Foundation

struct SavedModels {
    let SavedImage: String
    let SavedTitle: String
    let SavedInfo: String
    let SavedPrice: String
}

final class dummySavedModels {
    static let savedDatas: [SavedModels] = [
        SavedModels(SavedImage: "SavedImage_1.png", SavedTitle: "손오공이 잃어버린 머리띠 반쪽", SavedInfo: "손오공이 장난치다가 머리띠 반쪽 잘라서\n어딘가 숨겨둔 역사속 물건!!", SavedPrice: "942,192,000원"),
        SavedModels(SavedImage: "SavedImage_2.png", SavedTitle: "골드 반지", SavedInfo: "결혼 준비하는 당신?!\n약혼녀에게 이 반지를 선물하는 건 어때요?!", SavedPrice: "12,000원"),
        SavedModels(SavedImage: "SavedImage_3.png", SavedTitle: "하얀 신발", SavedInfo: "짝퉁 나이키 신발!\n정말 푹신푹신해서 걷다가 졸려서 넘어지...", SavedPrice: "90,000원"),
        SavedModels(SavedImage: "SavedImage_4.png", SavedTitle: "에베레스트 다이아 반지", SavedInfo: "에베레스트 올라가서 다이아 구하고 만든\n반지,,! 과연 이것을 누가 사갈것인가??", SavedPrice: "1,292,999,000원"),
        SavedModels(SavedImage: "SavedImage_5.png", SavedTitle: "아디다스다 신발", SavedInfo: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~", SavedPrice: "120,000원"),
        SavedModels(SavedImage: "SavedImage_6.png", SavedTitle: "황제 잠옷", SavedInfo: "어느 나라의 황제가 입었다던 잠옷\n크리스마스 트리같이 보이는 디자인!", SavedPrice: "120,000,000원"),
        SavedModels(SavedImage: "SavedImage_7.png", SavedTitle: "고장난 기타", SavedInfo: "블라블라블라블라\n블라블라블라블라블라", SavedPrice: "120,000원"),
        SavedModels(SavedImage: "SavedImage_1.png", SavedTitle: "손오공이 잃어버린 머리띠 반쪽", SavedInfo: "손오공이 장난치다가 머리띠 반쪽 잘라서\n어딘가 숨겨둔 역사속 물건!!", SavedPrice: "942,192,000원"),
        SavedModels(SavedImage: "SavedImage_2.png", SavedTitle: "골드 반지", SavedInfo: "결혼 준비하는 당신?!\n약혼녀에게 이 반지를 선물하는 건 어때요?!", SavedPrice: "12,000원"),
        SavedModels(SavedImage: "SavedImage_3.png", SavedTitle: "하얀 신발", SavedInfo: "짝퉁 나이키 신발!\n정말 푹신푹신해서 걷다가 졸려서 넘어지...", SavedPrice: "90,000원")
    ]
}
