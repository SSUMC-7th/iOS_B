//
//  ProductCollectionViewCell.swift
//  Kream_demo
//
//  Created by 황상환 on 11/1/24.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProductCollectionViewCell"
    
    // 배경 뷰
    private let backgroundImageView = UIView().then {
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    
    // 상품 이미지
    private let productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    // 북마크 버튼
    private let bookmarkButton = UIButton().then {
        $0.setImage(UIImage(systemName: "bookmark"), for: .normal)
        $0.tintColor = .black
    }
    
    // "거래 12.8만" 레이블
    private let tradeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = .darkGray
        $0.textAlignment = .right
    }
    
    // 브랜드명 레이블
    private let brandLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .black
    }
    
    // 상품명 레이블
    private let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    // 가격 레이블
    private let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .black
    }
    
    // "즉시 구매가" 레이블
    private let immediatePurchaseLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = .gray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        
        [backgroundImageView, productImageView, bookmarkButton, tradeLabel,
         brandLabel, nameLabel, priceLabel, immediatePurchaseLabel].forEach { addSubview($0) }
        
        backgroundImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(backgroundImageView.snp.width)  // 정사각형
        }
        
        productImageView.snp.makeConstraints {
            $0.edges.equalTo(backgroundImageView).inset(10)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(backgroundImageView).inset(12)
            $0.width.height.equalTo(24)
        }
        
        tradeLabel.snp.makeConstraints {
            $0.top.leading.equalTo(backgroundImageView).inset(12)
            $0.trailing.equalToSuperview().inset(12)
        }
        
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(backgroundImageView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(3)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(3)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(12)  
            $0.leading.equalToSuperview().inset(3)
        }
        
        immediatePurchaseLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(3)
            $0.bottom.equalToSuperview()  
        }
    }
    
    // 데이터 설정 메서드
    func configure(image: UIImage?, trade: String, brand: String, name: String, price: String) {
        productImageView.image = image
        tradeLabel.text = "거래 \(trade)"
        brandLabel.text = brand
        nameLabel.text = name
        priceLabel.text = price
    }
}
