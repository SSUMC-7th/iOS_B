//
//  ProductImageCollectionManager.swift
//  Kream_demo
//
//  Created by 황상환 on 11/7/24.
//

import Foundation
import UIKit

class ProductImageCollectionManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let data: [ProductDetailInfoModel]
    
    init(data: [ProductDetailInfoModel]) {
        self.data = data
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProductImageCell.identifier,
            for: indexPath
        ) as? ProductImageCell else {
            return UICollectionViewCell()
        }
        
        let model = data[indexPath.item]
        cell.configure(with: model.image)
        return cell
    }
}
