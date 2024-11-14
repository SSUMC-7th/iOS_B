//
//  ProductImageCell.swift
//  Kream_demo
//
//  Created by 황상환 on 11/7/24.
//

import Foundation
import UIKit

class ProductImageCell: UICollectionViewCell {
    static let identifier = "ProductImageCell"
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(imageView)
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(with image: UIImage?) {
        imageView.image = image
    }
}
