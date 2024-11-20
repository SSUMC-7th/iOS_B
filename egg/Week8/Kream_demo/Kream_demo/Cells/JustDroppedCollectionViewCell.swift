//
//  JustDroppedCollectionViewCell.swift
//  Kream_demo
//
//  Created by 황상환 on 11/1/24.
//

import Foundation
import UIKit

class JustDroppedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "JustDroppedCollectionViewCell"
    
    // 상품 이미지
    let productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    // 북마크 버튼
    let bookmarkButton = UIButton().then {
        $0.setImage(UIImage(named: "bookmark"), for: .normal)
        $0.tintColor = .black
    }
    
    // 브랜드 레이블
    let brandLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .black
    }
    
    // 상품명 레이블
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    // 가격 레이블
    let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
    }
    
    // 즉시구매가 레이블
    let immediateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 11)
        $0.textColor = .gray
        $0.text = "즉시 구매가"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        [productImageView, bookmarkButton, brandLabel,
         nameLabel, priceLabel, immediateLabel].forEach { addSubview($0) }
        
        productImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(productImageView.snp.width)  // 정사각형
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(productImageView).inset(8)
            $0.width.height.equalTo(24)
        }
        
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
        
        immediateLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview()
        }
    }
}
