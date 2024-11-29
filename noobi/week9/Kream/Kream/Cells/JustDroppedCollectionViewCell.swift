//
//  ProductUICollectionViewCell.swift
//  Kream
//
//  Created by 한금준 on 10/31/24.
//

import UIKit
import SnapKit
import Kingfisher

class JustDroppedCollectionViewCell : UICollectionViewCell {
    /// 식별자 지정
    static let identifier = "JustDroppedCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// 구성 요소 속성 지정
    let productImageView = UIImageView().then { make in
        make.contentMode = .scaleAspectFit
        make.clipsToBounds = true
        make.isUserInteractionEnabled = true
        make.layer.cornerRadius = 8
    }

    let brandLabel = UILabel().then { make in
        make.font = .systemFont(ofSize: 12, weight: .bold)
        make.textColor = .black
    }

    let nameLabel = UILabel().then { make in
        make.font = .systemFont(ofSize: 10, weight: .regular)
        make.textColor = .gray
        make.numberOfLines = 2
    }

    let priceLabel = UILabel().then { make in
        make.font = .systemFont(ofSize: 14, weight: .bold)
        make.textColor = .black
    }

    let transactionVolumeLabel = UILabel().then { make in
        make.font = .systemFont(ofSize: 12, weight: .regular)
        make.textColor = .gray
        make.textAlignment = .right
    }
    
    let descriptionLabel = UILabel().then{ make in
        make.font = .systemFont(ofSize: 8, weight: .regular)
        make.textColor = .gray
    }

    let bookmarkButton = UIButton().then { make in
        make.setImage(UIImage(systemName: "bookmark"), for: .normal)
        make.tintColor = .black
    }

    /// 각 구성 요소를 contentView에 추가한 후 SnapKit을 사용해 오토레이아웃을 설정
    private func setupView() {
        contentView.addSubview(productImageView)
        contentView.addSubview(transactionVolumeLabel)
        contentView.addSubview(brandLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(bookmarkButton)

        productImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(150)
        }

        transactionVolumeLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.top).offset(16)
            make.trailing.equalTo(productImageView.snp.trailing).offset(-8)
        }

        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(brandLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
        }

        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(8)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().inset(8)
        }

        bookmarkButton.snp.makeConstraints { make in
            make.centerY.equalTo(productImageView.snp.bottom).offset(-20)
            make.trailing.equalToSuperview().inset(8)
            make.width.height.equalTo(16)
        }
    }
    
    public func loadImage(from url: String) {
        if let imageURL = URL(string: url) {
            productImageView.kf.setImage(with: imageURL)
        }
    }

    /// 셀에 데이터를 설정
    func configure(with product: ProductModel) {
//        productImageView.image = product.savedImage
        productImageView.kf.setImage(with: product.imageUrl)
        brandLabel.text = product.brand
        nameLabel.text = product.name
        priceLabel.text = product.price
        descriptionLabel.text = product.describe
        transactionVolumeLabel.text = product.transactionVolume
    }
}

/// JustDroppedCollectionView에 셀을 추가하고, configure(with:) 메서드를 호출해 각 셀에 데이터를 설정
/// contentView는 UICollectionViewCell 클래스에 기본으로 포함된 속성
