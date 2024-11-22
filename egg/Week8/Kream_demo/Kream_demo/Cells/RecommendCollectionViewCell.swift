//
//  RecommendCollectionViewCell.swift
//  Kream_demo
//
//  Created by 황상환 on 11/19/24.
//

import Foundation
import UIKit
import Then

class RecommendCollectionViewCell: UICollectionViewCell {
    static let identifier = "RecommendCollectionViewCell"

    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13.5)
        $0.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        contentView.layer.cornerRadius = 20
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
