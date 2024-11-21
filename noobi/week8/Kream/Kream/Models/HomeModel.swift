//
//  HomeModel.swift
//  Kream
//
//  Created by 한금준 on 10/9/24.
//

import UIKit

///컬렉션 뷰에서 각 항목을 보여주기 위해 기본 구조를 정의한 구조체
struct HomeModel{
    let savedImage: UIImage
    let name: String
}

struct ProductModel{
    let savedImage: UIImage
    let name: String
    let brand: String?
    let price: String?
    let transactionVolume: String?
    let describe: String?
}

struct ChallengeModel {
    let savedImage: UIImage
    let name: String
}

extension HomeModel{
    ///  HomeCollectionView에 들어갈 dummy 데이터 10개를 추가
    static func homeDummyData() -> [HomeModel] {
        return [
            HomeModel(savedImage: .home1, name: "크림 드로우"),
            HomeModel(savedImage: .home2, name: "실시간 차트"),
            HomeModel(savedImage: .home3, name: "남성 추천"),
            HomeModel(savedImage: .home4, name: "여성 추천"),
            HomeModel(savedImage: .home5, name: "색다른 추천"),
            HomeModel(savedImage: .home6, name: "정가 아래"),
            HomeModel(savedImage: .home7, name: "윤세 24AW"),
            HomeModel(savedImage: .home8, name: "올해의 베스트"),
            HomeModel(savedImage: .home9, name: "10월 베네핏"),
            HomeModel(savedImage: .home10, name: "아크네 선물")
        ]
    }
    
    /// JustDroppedCollectionView에 들어갈 dummy 데이터 추가
    static func productDummyData() -> [ProductModel] {
        
        return [
            ProductModel(savedImage: .drop1, name: "청키러너 뉴욕 양키스", brand: "MLB", price: "139,000원",transactionVolume: "거래 12.8만",describe: "즉시구매가"),
            ProductModel(savedImage: .drop2, name: "Jordan 1 Retro High OG", brand: "Jordan", price: "228,000원",transactionVolume: "거래 15.6만",describe : "즉시구매가"),
            ProductModel(savedImage: .clothes1, name: "Matin Kim Logo Coating Jumper", brand: "마땡김 로고 코팅 점퍼 블랙", price: "228,000원", transactionVolume: "거래 34.5만", describe: "즉시구매가")
        ]
    }
    
    /// ChallengeCollectionView에 들어갈 dummy 데이터 추가
    static func challengeDummyData()-> [ChallengeModel] {
        
        return [
            ChallengeModel(savedImage: .person1, name: "@katarinabluu"),
            ChallengeModel(savedImage: .person2, name: "@imwinter"),
            ChallengeModel(savedImage: .person3, name: "@thousand_wooo")
        ]
    }
}
