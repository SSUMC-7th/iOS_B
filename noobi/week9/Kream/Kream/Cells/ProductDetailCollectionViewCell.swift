//
//  ProductDetailCollectionViewCell.swift
//  Kream
//
//  Created by 한금준 on 11/4/24.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell {
    /// 식별자 선언
    static let identifier: String = "ProductDetailCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 셀에 표시할 이미지 설정
    var imageView = UIImageView().then{
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 30
        $0.layer.masksToBounds = true
        $0.clipsToBounds = true
    }
    
    // UI 요소를 추가하고 제약 조건 설정
    private func setupView() {
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // 이미지가 셀을 꽉 채우도록 설정
        }
    }
    
    // 데이터 바인딩 메서드
    func configure(with model: ProductDetailModel) {
        imageView.image = model.clothesImage
    }
    
    
}
