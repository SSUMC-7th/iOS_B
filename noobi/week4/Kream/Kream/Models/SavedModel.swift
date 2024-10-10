//
//  SavedModel.swift
//  Kream
//
//  Created by 한금준 on 10/6/24.
//

import Foundation

struct SavedModel {
    let savedImage : String
    let savedName : String
}

final class dummySavedModel {
    static let savedDatas: [SavedModel] = [
        // dummy data 10개 생성
        SavedModel(savedImage: "상품1", savedName: "상품1"),
        SavedModel(savedImage: "상품2", savedName: "상품2"),
        SavedModel(savedImage: "상품3", savedName: "상품3"),
        SavedModel(savedImage: "상품4", savedName: "상품4"),
        SavedModel(savedImage: "상품5", savedName: "상품5"),
        SavedModel(savedImage: "상품6", savedName: "상품6"),
        SavedModel(savedImage: "상품7", savedName: "상품7"),
        SavedModel(savedImage: "상품8", savedName: "상품8"),
        SavedModel(savedImage: "상품9", savedName: "상품9"),
        SavedModel(savedImage: "상품10", savedName: "상품10"),
    ]
}
