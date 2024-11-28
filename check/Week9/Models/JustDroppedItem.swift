//
//  ItemModel.swift
//  Week5_Mission
//
//  Created by LEE on 2024/10/31.
//

import Foundation

struct JustDroppedItem{
    let image: String
    let title: String
    let subTitle: String
    let price: String
}

final class dummyJustDroppedItemModel{
    static let ItemModelDatas: [JustDroppedItem] = [
        JustDroppedItem(image: "https://kream-phinf.pstatic.net/MjAyNDExMjVfMTE1/MDAxNzMyNTA0ODMxMDYw.EQhFY03jajCKOp4QzVQyJxTsD7RWHL-XhcPt9hsZWz0g.sJXxONhj0D7bRs82QKBKrC29hX2qZe17fgBFoLDruUcg.PNG/a_68eaf46d40d24f349aba27a7a1109afb.png?type=m_webp", title: "Jordan", subTitle: "조던 X 트래비스캇", price: "384,000원"),
        JustDroppedItem(image: "https://kream-phinf.pstatic.net/MjAyNDA5MjVfMTA3/MDAxNzI3MjMwNzg4OTc3.9RD0EwAQynqoLRChAp_d4HIKhyNuVsV4PPv7v1uBOwkg.tdtG0Pn7Cq-t1Jf-o2nafJNsvDypVIOgD-hg45XzX6og.PNG/a_5ce22b2d2751459d9485bf443715a42a.png?type=m_webp", title: "Goal Studio", subTitle: "Jordan 1 Retro High OGYellow Ochre", price: "286,000원"),
        JustDroppedItem(image: "https://kream-phinf.pstatic.net/MjAyNDExMjBfMjI3/MDAxNzMyMDk0MzI4NTQ2.KYsJCb3zGRCUUHd1jB6Lq4LepdRv_EiKtNV-RLCXdxEg.l413m5_v3dEnibskLlKxZ5ITHkC5TTq7A-JazVknQ0Mg.PNG/a_7ecbbf92ea5341788e59068e1c279625.png?type=m_webp", title: "IAB Studio", subTitle: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원"),
        JustDroppedItem(image: "https://kream-phinf.pstatic.net/MjAyMjA5MjFfMjQ1/MDAxNjYzNzQ3MDkyMjEw.7_T8pKYhW14ACK6y-OFmrfHQNBnxzYtxNnmZSaSlXSEg.x3e35bd4_2zevcAAJFd88W2lquz2faxIvQzdm5vkLhYg.JPEG/a_fbd0c0010dbb400793bc2f01940740ee.jpg?type=m_webp", title: "Human Made", subTitle: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원"),
        JustDroppedItem(image: "https://kream-phinf.pstatic.net/MjAyMzEwMjVfMjE0/MDAxNjk4MjExMjc1Mzkx.Wt4wdJ-6gfNVlhvqAjYztlmpYLimyST8f4tVasKOZGwg.347Tdy3nlEJMVrZrOYQPCW8gkao70fd_ykhJ0u3Bmu8g.JPEG/a_06b6b2f2a84d4b3a99cdec88a5cd33c7.jpg?type=m_webp", title: "Human Made", subTitle: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원"),
        JustDroppedItem(image: "https://kream-phinf.pstatic.net/MjAyNDExMTJfMjkg/MDAxNzMxMzkyNzMyMjA2.MlgiQFXu6_RWxTuNtks6186nB68KJ7Lab9SF91XCH5cg.EAondXbRQUED5DVWli-ZYwCj55JxoptQNjquyHD00t0g.PNG/a_1a10a7487a0543cfbf1a91423f4d8e73.png?type=m_webp", title: "Human Made", subTitle: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원"),
        JustDroppedItem(image: "https://kream-phinf.pstatic.net/MjAyNDEwMDRfMjk4/MDAxNzI4MDM1Mjk4MTk0.yibIMhETlmFOQ5h6dhvNGK-rLJsTwFpogL4kQGkvntUg.-BNjFeb60ySVqWPSzQ6vE3suYwKaQFVO5YKqRILjmacg.PNG/a_d6136877bc754ee88ac434ee978f08c7.png?type=m_webp", title: "Human Made", subTitle: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원"),
        JustDroppedItem(image: "https://kream-phinf.pstatic.net/MjAyMzAxMzBfMTIw/MDAxNjc1MDY2MTc0NDc1.6wTeIIH2w2WJvDCPtUHJaUZlQKRBsgJAhPFTcjHkVZUg.Phgo0_-hKxK0FCMoLJw-aRKVr8POl3f_EoQa3aildAMg.JPEG/p_0e573f3aadac45f29251bbedbb5d7f80.jpg?type=m_webp", title: "Human Made", subTitle: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원"),
        JustDroppedItem(image: "https://kream-phinf.pstatic.net/MjAyNDExMjdfMjQx/MDAxNzMyNjk0ODg5MDU1.9dHsImoCk-L1MqzyLoJRHYA4IVioMaSoV1aUzyqPTHwg.4Ul8F6L0AdI9uzCYCSanpfErpqmY-yMGd2B7n0hf8T8g.PNG/a_3d528720ac11467dbd472a35c5f3ac61.png?type=m_webp", title: "Human Made", subTitle: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원"),
        
    ]
}
