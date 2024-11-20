//
//  ProductDetailInfoView.swift
//  Kream_demo
//
//  Created by 황상환 on 11/7/24.
//

import Foundation
import UIKit

class ProductDetailInfoView: UIView {
    
    // MARK: - Properties
    
    private let contentView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let mainImageView = UIImageView().then {
        $0.image = UIImage(named: "Main_black")
        $0.contentMode = .scaleAspectFit
    }
    
    let imageCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: 53, height: 53) // 이미지 크기
    
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(ProductImageCell.self, forCellWithReuseIdentifier: ProductImageCell.identifier)
        return cv
    }()
    
    private let instancePrice = UILabel().then {
        $0.text = "즉시구매가"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
    }
    
    private let realPrice = UILabel().then {
        $0.text = "228,000원"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .black
    }
    
    private let productTitleEn = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
    }
    
    private let productTitleKr = UILabel().then {
        $0.text = "마팅킴 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .gray
    }
    
    private let bookMarkButton = UIButton().then {
            $0.setImage(UIImage(systemName: "bookmark"), for: .normal)
            $0.tintColor = .black
        }
        
    private let bookmarkCount = UILabel().then {
        $0.text = "2,122"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .black
    }
        
    let buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 239/255, green: 98/255, blue: 83/255, alpha: 1)
        button.layer.cornerRadius = 10
        
        // 버튼 내부 스택뷰
        let stackView = UIStackView()
        stackView.isUserInteractionEnabled = false
        stackView.axis = .horizontal  // 수평 방향
        stackView.alignment = .center
        stackView.spacing = 8
        
        // "구매" 레이블
        let titleLabel = UILabel()
        stackView.isUserInteractionEnabled = false
        titleLabel.text = "구매"
        titleLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        titleLabel.textColor = .white
        
        // 가격 정보를 담는 수직 스택뷰
        let priceStackView = UIStackView()
        stackView.isUserInteractionEnabled = false
        priceStackView.axis = .vertical
        priceStackView.alignment = .leading
        priceStackView.spacing = 2
        
        // 가격 레이블
        let priceLabel = UILabel()
        stackView.isUserInteractionEnabled = false
        priceLabel.text = "345,000"
        priceLabel.font = .systemFont(ofSize: 15, weight: .bold)
        priceLabel.textColor = .white
        
        // 설명 레이블
        let subtitleLabel = UILabel()
        stackView.isUserInteractionEnabled = false
        subtitleLabel.text = "즉시구매가"
        subtitleLabel.font = .systemFont(ofSize: 11)
        subtitleLabel.textColor = .white.withAlphaComponent(0.8)
        
        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(subtitleLabel)
        
        [titleLabel, priceStackView].forEach {
            stackView.addArrangedSubview($0)
        }
        
        button.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        return button
    }()

    private let sellButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 97/255, green: 187/255, blue: 122/255, alpha: 1)
        button.layer.cornerRadius = 10
        
        // 버튼 내부 스택뷰
        let stackView = UIStackView()
        stackView.axis = .horizontal  // 수평 방향
        stackView.alignment = .center
        stackView.spacing = 8
        
        // "판매" 레이블
        let titleLabel = UILabel()
        titleLabel.text = "판매"
        titleLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        titleLabel.textColor = .white
        
        // 가격 정보를 담는 수직 스택뷰
        let priceStackView = UIStackView()
        priceStackView.axis = .vertical
        priceStackView.alignment = .leading
        priceStackView.spacing = 2
        
        // 가격 레이블
        let priceLabel = UILabel()
        priceLabel.text = "396,000"
        priceLabel.font = .systemFont(ofSize: 15, weight: .bold)
        priceLabel.textColor = .white
        
        // 설명 레이블
        let subtitleLabel = UILabel()
        subtitleLabel.text = "즉시판매가"
        subtitleLabel.font = .systemFont(ofSize: 11)
        subtitleLabel.textColor = .white.withAlphaComponent(0.8)
        
        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(subtitleLabel)
        
        [titleLabel, priceStackView].forEach {
            stackView.addArrangedSubview($0)
        }
        
        button.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        return button
    }()
    

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupConstraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup
    private func setupLayout() {
        addSubview(contentView)
        
        [mainImageView, imageCollection, instancePrice,
         realPrice, productTitleEn, productTitleKr,
         bookMarkButton, bookmarkCount, buyButton, sellButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide).offset(10)
            $0.leading.trailing.equalToSuperview() // 이 부분 추가
            $0.height.equalTo(374)
        }
        
        imageCollection.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(53)
        }
        
        instancePrice.snp.makeConstraints {
            $0.top.equalTo(imageCollection.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
        }
        
        realPrice.snp.makeConstraints {
            $0.top.equalTo(instancePrice.snp.bottom).offset(4)
            $0.leading.equalTo(instancePrice)
        }
        
        productTitleEn.snp.makeConstraints {
            $0.top.equalTo(realPrice.snp.bottom).offset(18)
            $0.leading.equalTo(realPrice)
        }
        
        productTitleKr.snp.makeConstraints {
            $0.top.equalTo(productTitleEn.snp.bottom).offset(4)
            $0.leading.equalTo(productTitleEn)
        }
        
        bookMarkButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-32)
            $0.width.height.equalTo(24)
        }
        
        bookmarkCount.snp.makeConstraints {
            $0.top.equalTo(bookMarkButton.snp.bottom).offset(3)
            $0.centerX.equalTo(bookMarkButton)
        }
        
        buyButton.snp.makeConstraints {
            $0.leading.equalTo(bookMarkButton.snp.trailing).offset(16)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-16)
            $0.width.equalTo(147)
            $0.height.equalTo(50)
        }
        
        sellButton.snp.makeConstraints {
            $0.leading.equalTo(buyButton.snp.trailing).offset(16)  
            $0.bottom.equalTo(buyButton)
            $0.height.equalTo(buyButton)
            $0.width.equalTo(buyButton)
        }
    }
}
