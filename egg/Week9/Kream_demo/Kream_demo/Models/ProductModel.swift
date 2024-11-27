//
//  ProductModel.swift
//  Kream_demo
//
//  Created by 황상환 on 11/1/24.
//

import Foundation
import UIKit
import Kingfisher

struct ProductModel {
    let imageURL: String
    let tradeCount: String
    let brand: String
    let name: String
    let price: String
}

// 이미지 string으로 변경하고 URL로!
extension ProductModel {
    static func dummy() -> [ProductModel] {
        return [
            ProductModel(
                imageURL:"https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041814981qduu.jpg",
                tradeCount: "12.8만",
                brand: "MLB",
                name: "청키라이너 뉴욕양키스",
                price: "139,000원"
            ),
            ProductModel(
                imageURL:"https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041821148voul.jpg",                tradeCount: "15.6만",
                brand: "Jordan",
                name: "Jordan 1 Retro High OG Yellow Ochre",
                price: "228,000원"
            ),
            ProductModel(
                imageURL:"https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041823647qhly.jpg",                tradeCount: "2.0만",
                brand: "Human Made",
                name: "Varsity Jacket",
                price: "2,000,000원"
            ),
            ProductModel(
                imageURL:"https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041827439murc.jpg",
                tradeCount: "12.8만",
                brand: "MLB",
                name: "청키라이너 뉴욕양키스",
                price: "139,000원"
            ),
            ProductModel(
                imageURL:"https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041830167sxif.jpg",                tradeCount: "15.6만",
                brand: "Jordan",
                name: "Jordan 1 Retro High OG Yellow Ochre",
                price: "228,000원"
            ),
            ProductModel(
                imageURL:"https://post-phinf.pstatic.net/MjAyMjA0MjFfMjcg/MDAxNjUwNTI5NDczMDI0.Xgn_oOnpdsDqNLnpKIlhoZ0c8rz1UFknN6fMmyi-Na0g.k0yZgpHEMXnuibebt7xF946128PzsrdORHd1LaVJCo0g.JPEG/7.jpg?type=w1200",                tradeCount: "2.0만",
                brand: "Human Made",
                name: "Varsity Jacket",
                price: "2,000,000원"
            ),
            ProductModel(
                imageURL:"https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041814981qduu.jpg",
                tradeCount: "12.8만",
                brand: "MLB",
                name: "청키라이너 뉴욕양키스",
                price: "139,000원"
            ),
            ProductModel(
                imageURL:"https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041814981qduu.jpg",                tradeCount: "15.6만",
                brand: "Jordan",
                name: "Jordan 1 Retro High OG Yellow Ochre",
                price: "228,000원"
            ),
            ProductModel(
                imageURL:"https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041814981qduu.jpg",                tradeCount: "2.0만",
                brand: "Human Made",
                name: "Varsity Jacket",
                price: "2,000,000원"
            ),
            ProductModel(
                imageURL:"https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041814981qduu.jpg",
                tradeCount: "12.8만",
                brand: "MLB",
                name: "청키라이너 뉴욕양키스",
                price: "139,000원"
            ),
            ProductModel(
                imageURL:"https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041814981qduu.jpg",                tradeCount: "15.6만",
                brand: "Jordan",
                name: "Jordan 1 Retro High OG Yellow Ochre",
                price: "228,000원"
            ),
            ProductModel(
                imageURL:"https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041814981qduu.jpg",                tradeCount: "2.0만",
                brand: "Human Made",
                name: "Varsity Jacket",
                price: "2,000,000원"
            )
        ]
    }
}
