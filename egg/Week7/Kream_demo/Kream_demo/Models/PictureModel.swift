//
//  PictureModel.swift
//  Kream_demo
//
//  Created by 황상환 on 11/1/24.
//

import Foundation
import UIKit

struct PictureModel {
    let image: UIImage?
    let userName: String
}

extension PictureModel {
    static func dummy() -> [PictureModel] {
        return [
            PictureModel(image: UIImage(named: "katarina"), userName: "katarina"),
            PictureModel(image: UIImage(named: "winter"), userName: "imwinter"),
            PictureModel(image: UIImage(named: "thousand"), userName: "thousand")
        ]
    }
}
