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
//    let savedImage: UIImage
    let imageUrl: URL
    let name: String
    let brand: String?
    let price: String?
    let transactionVolume: String?
    let describe: String?
}

struct ChallengeModel {
//    let savedImage: UIImage
    let imageUrl: URL
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
            ProductModel(
//                savedImage: .drop1,
                imageUrl: URL(string: "https://s3-alpha-sig.figma.com/img/3888/3485/40338332862dec62a2a1370c053f1e3d?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=keSrlZ4MTCiheZbY~A8jVjzZKKmH43n1mGW7aSZ54l0Y1qEKFSo-a5bv~NKMUZ9x3u9yaOLhQnuldMN-KnKZC5PM0v8hOcptra07z40Zkq8CjOt-5ju9aNoG2IjFShuZFSfWevo2AOKCHoblBNhvK6Zp5LPn34EykTbehIhm342Y4fPxceqX5QqNCAqZEr58C9Um6F0TkkbFu8eb33vvLF8FL7SgRpu1J6jG9~BraFjomNO6cz7NII4~T~bRWTLFGMQaB6cm46T8JdjQ0jXPP2gA3z0ntghVAnw9RfrPo-ZxY5z8w6hCYEJ9k96h3ukINrQC2ofLLrWAZVvMd7Mmiw__")!,
                name: "청키러너 뉴욕 양키스",
                brand: "MLB",
                price: "139,000원",
                transactionVolume: "거래 12.8만",
                describe: "즉시구매가"
            ),
            ProductModel(
//                savedImage: .drop2,
                imageUrl: URL(string: "https://s3-alpha-sig.figma.com/img/44e5/158d/85a822e2d9940249bee1e726f0fa4df1?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ePyG2YWpTiTYEdS05WEarX~XT-1Wyc8jz7VSQBmfWkzECS~f-914ZiCVL2a7vaFt8aH52HR-7bbud2q532hMnnCgT8GSl-FQ5IW~t7zx3iLcIq3CUeBU6~q9H4hTVZCgfkPwalmg-2xgSG5ttwlRlCjPNWIPadTpj9A0wwRgELLK4JMdbv3HY5r65GSY9d4fSd2204NFvS06L06xxdCcCOT2q8qrCWbyL59TwlaBlyFcPHi2xSkRKK2CVvq5LXBx--jKwCe4g6tW~DNKKZhGaWi4TSMDkgNUxGK7H~nUltZvrKKArhMTW1MIKmmINpdXD~QaobJckmQ-uwx7LnkJZQ__")!,
                name: "Jordan 1 Retro High OG",
                brand: "Jordan",
                price: "228,000원",
                transactionVolume: "거래 15.6만",
                describe : "즉시구매가"
            ),
            ProductModel(
//                savedImage: .clothes1,
                imageUrl: URL(string: "https://s3-alpha-sig.figma.com/img/6405/60ad/f845a3a967992652b95e739c468ce356?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Wje1MmGH4yCjvFOZHFjT097qG-cVibjD4rrzwX6Vjb0SH4h81NG0oG2o8SXJV2vbpLO6khh4EiVoP4V6pCaUN9re4l-gLg2DwsMg4Vp03mamC~3pCbEaXBdo1elZ50IDBgpQRg5YbgEKHHiIP8CshdcN2onp61-HK~OxWCqF50CWKym2yTmxx8xMOptLcDkiIEmVAPpVcFsA8opE7VPxmov~9syh5Hu2gId1lGNb91YCXDMMUG38cGa9W3njPqrPat1ETXi7WRFedtmcvELcwmwSLZcLV0eaO81XDACvQw15v~ibEUDkb-N-VbgS1ZurEj7p2yFMpr8z6865QckAog__")!,
                name: "Matin Kim Logo Coating Jumper",
                brand: "마땡김 로고 코팅 점퍼 블랙",
                price: "228,000원",
                transactionVolume: "거래 34.5만",
                describe: "즉시구매가"
            ),
            ProductModel(
//                savedImage: .clothes1,
                imageUrl: URL(string: "https://img.danawa.com/prod_img/500000/436/224/img/17224436_1.jpg?_v=20220610092752")!,
                name: "스투시 맨투맨",
                brand: "마땡김 로고 코팅 점퍼 블랙",
                price: "228,000원",
                transactionVolume: "거래 34.5만",
                describe: "즉시구매가"
            ),
            ProductModel(
//                savedImage: .clothes1,
                imageUrl: URL(string: "https://www.ocokorea.com//upload/images/product/111/111888/Product_1670035608378.jpg")!,
                name: "Matin Kim Logo Coating Jumper",
                brand: "나이키 맨투맨",
                price: "228,000원",
                transactionVolume: "거래 34.5만",
                describe: "즉시구매가"
            ),
            ProductModel(
//                savedImage: .clothes1,
                imageUrl: URL(string: "https://lh6.googleusercontent.com/proxy/OE3Ep7rPznbA1KdIFJ40kgqWiQtS6_wZ9i1RCFzvV3Da0OdKRbfpWG4ResZpOAmuL1lSb4eIAx2xoUN2U_GWGOSTaO9S6G8PyGX0io0_IF7yhcID_Q")!,
                name: "Matin Kim Logo Coating Jumper",
                brand: "솔리드 맨투맨",
                price: "228,000원",
                transactionVolume: "거래 34.5만",
                describe: "즉시구매가"
            ),
            ProductModel(
//                savedImage: .clothes1,
                imageUrl: URL(string: "https://item.elandrs.com/r/image/item/2023-10-13/fbb4c2ed-930a-4cb8-97e0-d4f287a1c971.jpg?w=750&h=&q=100")!,
                name: "Matin Kim Logo Coating Jumper",
                brand: "폴로 맨투맨",
                price: "228,000원",
                transactionVolume: "거래 34.5만",
                describe: "즉시구매가"
            ),
            ProductModel(
//                savedImage: .clothes1,
                imageUrl: URL(string: "https://cafe24.poxo.com/ec01/mnp7/HOvhRhvOk+Cp2KY4JuusAnwQW+ucEeAikzB6Rzosi0JVLzCJ3Sgz+ZyDCGmi4haKzUw8F3DoTk2b/DU3iwpUsA==/_/web/product/big/202408/767b7f8c2a436193a38134b84d382d96.jpg")!,
                name: "Matin Kim Logo Coating Jumper",
                brand: "MNMP 맨투맨",
                price: "228,000원",
                transactionVolume: "거래 34.5만",
                describe: "즉시구매가"
            ),
            ProductModel(
//                savedImage: .clothes1,
                imageUrl: URL(string: "https://image.folderstyle.com/data/folderstyle_data/images/product/00/00/05/77/53/m_0000057753.gif")!,
                name: "Matin Kim Logo Coating Jumper",
                brand: "봉봉 맨투맨",
                price: "228,000원",
                transactionVolume: "거래 34.5만",
                describe: "즉시구매가"
            ),
            ProductModel(
//                savedImage: .clothes1,
                imageUrl: URL(string: "https://m.wooilsin.kr/web/product/big/202403/c386aa3005c8a4900fd44e153ca748c8.jpg")!,
                name: "Matin Kim Logo Coating Jumper",
                brand: "에리카 맨투맨",
                price: "228,000원",
                transactionVolume: "거래 34.5만",
                describe: "즉시구매가"
            ),
        ]
    }
    
    /// ChallengeCollectionView에 들어갈 dummy 데이터 추가
    static func challengeDummyData()-> [ChallengeModel] {
        
        return [
            ChallengeModel(
//                savedImage: .person1,
                imageUrl: URL(string: "https://cdn.newsculture.press/news/photo/202404/546298_687539_5839.jpg")!,
                name: "@katarinabluu"
            ),
            ChallengeModel(
//                savedImage: .person2,
                imageUrl: URL(string: "https://img.sportsworldi.com/content/image/2023/06/11/20230611511522.jpg")!,
                name: "@imwinter"
            ),
            ChallengeModel(
//                savedImage: .person3,
                imageUrl: URL(string: "https://news.nateimg.co.kr/orgImg/bn/2023/04/03/bnt202304030249.680x.0.jpg")!,
                name: "@thousand_wooo"
            ),
            ChallengeModel(
//                savedImage: .person1,
                imageUrl: URL(string: "https://img.wkorea.com/w/2023/12/style_658d8b5ae60c3.jpg")!,
                name: "@katarinabluu"
            ),
            ChallengeModel(
//                savedImage: .person2,
                imageUrl: URL(string: "https://img.wkorea.com/w/2023/12/style_658d8ba071655.jpg")!,
                name: "@imwinter"
            ),
            ChallengeModel(
//                savedImage: .person3,
                imageUrl: URL(string: "https://img.wkorea.com/w/2023/12/style_658d8bcf8f5ad.jpg")!,
                name: "@thousand_wooo"
            ),
            ChallengeModel(
//                savedImage: .person1,
                imageUrl: URL(string: "https://img.wkorea.com/w/2024/01/style_65926963cc687-500x500.jpg?x=1280&y=1895")!,
                name: "@katarinabluu"
            ),
            ChallengeModel(
//                savedImage: .person2,
                imageUrl: URL(string: "https://img.wkorea.com/w/2023/12/style_658abe5e84e9e-500x500.jpg?x=1080&y=1080")!,
                name: "@imwinter"
            ),
            ChallengeModel(
//                savedImage: .person3,
                imageUrl: URL(string: "https://img.wkorea.com/w/2023/12/style_6582e57385b9b-500x500.jpg?x=1080&y=1608")!,
                name: "@thousand_wooo"
            ),
            ChallengeModel(
//                savedImage: .person3,
                imageUrl: URL(string: "https://img.wkorea.com/w/2024/01/style_65a4e20dc96f2-700x1050.jpeg")!,
                name: "@thousand_wooo"
            )
        ]
    }
}
