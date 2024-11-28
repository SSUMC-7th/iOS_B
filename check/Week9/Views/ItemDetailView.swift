//
//  ItemDetailView.swift
//  Week6_Mission
//
//  Created by LEE on 2024/11/07.
//

import UIKit

class ItemDetailView: UIView {
    
    // 메인 상품 이미지
    let imageView = UIImageView().then{
        $0.image = UIImage(named: "메인 상품1.png")
    }
    
    // 상품 다른 색상 리스트 뷰
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.itemSize = .init(width: 60, height: 60)
        $0.minimumInteritemSpacing = 10
        $0.scrollDirection = .horizontal
    }).then{
        $0.tag = 0
        $0.register(DifferentColorCell.self, forCellWithReuseIdentifier: DifferentColorCell.identifier)
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
    }
    
    // 즉시 구매가 레이블
    let buyLabel = UILabel().then{
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 12, weight: .light)
    }
    
    // 가격 레이블
    let priceLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.text = "228,000원"
    }
    
    // 상품 영어 이름 레이블
    let itemEngNameLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.text = "Matin Kim Logo Coating Jumper"
    }
    
    // 상품 한글 이름 레이블
    let itemKorNameLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .gray
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
    }
    
    
    let bookmarkButton = UIImageView().then{
        $0.image = UIImage(systemName: "bookmark")
        $0.tintColor = .black
    }
    
    let bookmarkCountLabel = UILabel().then{
        $0.text = "2,122"
        $0.font = .systemFont(ofSize: 12, weight: .light)
    }
    
    let buyButton = ActionButton().then{
        $0.leftLabel.text = "구매"
        $0.priceLabel.text = "345,000"
        $0.subLabel.text = "즉시 구매가"
        $0.subLabel.textColor = UIColor(red: 163/255, green: 55/255, blue: 35/255, alpha: 1)
        $0.backgroundColor = UIColor(red: 239/255, green: 98/255, blue: 84/255, alpha: 1)
    }
    
    let sellButton = ActionButton().then{
        $0.leftLabel.text = "판매"
        $0.priceLabel.text = "396,000"
        $0.subLabel.text = "즉시 판매가"
        $0.subLabel.textColor = UIColor(red: 31/255, green: 119/255, blue: 69/255, alpha: 1)
        $0.backgroundColor = UIColor(red: 65/255, green: 185/255, blue: 122/255, alpha: 1)
    }
    
    // MARK: - 이니셜라이저
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setViews()
        self.setConstraints()
    }
    
    
    required init?(coder: NSCoder){
        fatalError("NSCoder Error")
    }
    
    
    func setViews(){
        addSubview(imageView)
        addSubview(collectionView)
        addSubview(buyLabel)
        addSubview(priceLabel)
        addSubview(itemEngNameLabel)
        addSubview(itemKorNameLabel)
        addSubview(buyButton)
        addSubview(sellButton)
        addSubview(bookmarkButton)
        addSubview(bookmarkCountLabel)
        
    }
    
    func setConstraints(){
        
        imageView.snp.makeConstraints{(make) in
            make.top.equalTo(safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.snp.width)
        }
        
        collectionView.snp.makeConstraints{(make) in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(60)
        }
        
        buyLabel.snp.makeConstraints{(make) in
            make.left.equalToSuperview().inset(16)
            make.top.equalTo(collectionView.snp.bottom).offset(24)
        }
        
        priceLabel.snp.makeConstraints{(make) in
            make.left.equalTo(buyLabel)
            make.top.equalTo(buyLabel.snp.bottom).offset(4)
        }
        
        itemEngNameLabel.snp.makeConstraints{(make) in
            make.left.equalTo(buyLabel)
            make.top.equalTo(priceLabel.snp.bottom).offset(18)
        }
        
        itemKorNameLabel.snp.makeConstraints{(make) in
            make.left.equalTo(buyLabel)
            make.top.equalTo(itemEngNameLabel.snp.bottom).offset(6)
        }
        
        bookmarkButton.snp.makeConstraints{(make) in
            make.left.equalToSuperview().inset(20)
            make.top.equalTo(buyButton).offset(4)
            make.width.equalTo(25)
            make.height.equalTo(25)

        }
        
        bookmarkCountLabel.snp.makeConstraints{(make) in
            make.centerX.equalTo(bookmarkButton)
            make.top.equalTo(bookmarkButton.snp.bottom).offset(1)
        }
        
        buyButton.snp.makeConstraints{(make) in
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.left.equalTo(bookmarkButton.snp.right).offset(20)
            make.height.equalTo(45)
            make.width.equalTo(150)
        }
        
        sellButton.snp.makeConstraints{(make) in
            make.bottom.equalTo(buyButton)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(45)
            make.width.equalTo(150)
        }
        
        
    }
}
