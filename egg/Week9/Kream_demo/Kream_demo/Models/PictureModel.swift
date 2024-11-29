//
//  PictureModel.swift
//  Kream_demo
//
//  Created by 황상환 on 11/1/24.
//

import Foundation
import UIKit
import Kingfisher

struct PictureModel {
    let imageURL: String
    let userName: String
}

extension PictureModel {
    static func dummy() -> [PictureModel] {
        return [
            PictureModel(
                imageURL: "https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041823647qhly.jpg",
                userName: "katarina"
            ),
            PictureModel(
                imageURL: "https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041814981qduu.jpg",
                userName: "imwinter"
            ),
            PictureModel(
                imageURL: "https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041821148voul.jpg",
                userName: "thousand"
            ),
            PictureModel(
                imageURL: "https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041823647qhly.jpg",
                userName: "katarina"
            ),
            PictureModel(
                imageURL: "https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041823647qhly.jpg",
                userName: "imwinter"
            ),
            PictureModel(
                imageURL: "https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041823647qhly.jpg",
                userName: "thousand"
            ),
            PictureModel(
                imageURL: "https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041823647qhly.jpg",
                userName: "katarina"
            ),
            PictureModel(
                imageURL: "https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041823647qhly.jpg",
                userName: "imwinter"
            ),
            PictureModel(
                imageURL: "https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041823647qhly.jpg",
                userName: "thousand"
            ),
            PictureModel(
                imageURL: "https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041823647qhly.jpg",
                userName: "katarina"
            ),
            PictureModel(
                imageURL: "https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041823647qhly.jpg",
                userName: "imwinter"
            ),
            PictureModel(
                imageURL: "https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041823647qhly.jpg",
                userName: "thousand"
            )
        ]
    }
}
