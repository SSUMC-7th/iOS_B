//
//  SavedItemModel.swift
//  Week3_Mission
//
//  Created by LEE on 2024/10/10.
//

import Foundation

struct SavedItemModel{
    let itemImage : String
    let itemTitle : String
    let itemDescription: String
    let itemPrice : String
}

final class dummySavedItemModel{
    static let savedItemDatas: [SavedItemModel] = [
        SavedItemModel(itemImage: "상품 이미지1.png", itemTitle: "손오공이 잃어버린 머리띠 반쪽", itemDescription: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", itemPrice: "942,192,000원"),
        SavedItemModel(itemImage: "상품 이미지2.png", itemTitle: "골드 반지", itemDescription: "결혼 준비하는 당신?! 약혼녀에게 이 반지를 선물하는 건 어때요?!", itemPrice: "12,000원"),
        SavedItemModel(itemImage: "상품 이미지3.png", itemTitle: "하얀 신발", itemDescription: "짝퉁 나이키 신발! 정말 푹신푹신해서 걷다가 졸려서 넘어지...", itemPrice: "90,000원"),
        SavedItemModel(itemImage: "상품 이미지4.png", itemTitle: "에베레스트 다이아 반지", itemDescription: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈것인가??", itemPrice: "1,292,999,000원"),
        SavedItemModel(itemImage: "상품 이미지5.png", itemTitle: "아디다스다 신발", itemDescription: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~", itemPrice: "120,000원"),
        SavedItemModel(itemImage: "상품 이미지6.png", itemTitle: "황제 잠옷", itemDescription: "어느 나라의 황제가 입었다던 잠옷 크리스마스 트리같이 보이는 디자인!", itemPrice: "120,000,000원"),
        SavedItemModel(itemImage: "상품 이미지7.png", itemTitle: "고장난 기타", itemDescription: "블라블라블라블라블라블라블라블라블라", itemPrice: "120,000원"),
        SavedItemModel(itemImage: "상품 이미지8.png", itemTitle: "하얀 음료", itemDescription: "이 음료를 마시면 건강해져요 근데 어디가 건강해질까요? 한 번 마셔겠.....", itemPrice: "120,000원"),
        SavedItemModel(itemImage: "상품 이미지4.png", itemTitle: "에베레스트 다이아 반지", itemDescription: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈것인가??", itemPrice: "1,292,999,000원"),
        SavedItemModel(itemImage: "상품 이미지2.png", itemTitle: "골드 반지", itemDescription: "결혼 준비하는 당신?! 약혼녀에게 이 반지를 선물하는 건 어때요?!", itemPrice: "12,000원"),
    
    ]
}
