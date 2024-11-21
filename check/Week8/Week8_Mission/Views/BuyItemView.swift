//
//  BuyItemView.swift
//  Week6_Mission
//
//  Created by LEE on 2024/11/07.
//

import UIKit

class BuyItemView: UIView {
    
    let titleLabel = UILabel().then{
        $0.text = "구매하기"
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        
    }
    
    let subTitleLabel = UILabel().then{
        $0.text = "(가격 단위 : 원)"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .gray
    }
    
    let imageView = UIImageView().then{
        $0.image = UIImage(named: "메인 상품1.png")
    }
    
    let itemEngNameLabel = UILabel().then{
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.textColor = .black
    }
    
    let itemKorNameLabel = UILabel().then{
        $0.text = "마뗑킴 로고 코딩 점퍼 블랙"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .gray
    }
    
    let sSizeButton = SizeButton().then{
        $0.sizeLabel.text = "S"
        $0.priceLabel.text = "360,000"
    }
    
    let mSizeButton = SizeButton().then{
        $0.sizeLabel.text = "M"
        $0.priceLabel.text = "380,000"
    }
    
    let lSizeButton = SizeButton().then{
        $0.sizeLabel.text = "L"
        $0.priceLabel.text = "360,000"
    }
    
    let xlSizeButton = SizeButton().then{
        $0.sizeLabel.text = "XL"
        $0.priceLabel.text = "360,000"
    }
    
    let xxlSizeButton = SizeButton().then{
        $0.sizeLabel.text = "XXL"
        $0.priceLabel.text = "360,000"
    }
    
    let quickBuyButton = DetailActionButton().then{
        $0.priceLabel.text = "345,000"
        $0.subLabel.text = "빠른배송(1~2일 소요)"
        $0.backgroundColor = UIColor(red: 239/255, green: 98/255, blue: 84/255, alpha: 1)
    }
    
    let buyButton = DetailActionButton().then{
        $0.priceLabel.text = "407,000"
        $0.subLabel.text = "일반배송(5~7일 소요)"
        $0.backgroundColor = .black
    }
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        setSubViews()
        setConstraints()

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setSubViews(){
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(imageView)
        addSubview(itemKorNameLabel)
        addSubview(itemEngNameLabel)
        addSubview(sSizeButton)
        addSubview(mSizeButton)
        addSubview(lSizeButton)
        addSubview(xlSizeButton)
        addSubview(xxlSizeButton)
        addSubview(quickBuyButton)
        addSubview(buyButton)

    }
    
    func setConstraints(){
        titleLabel.snp.makeConstraints{(make) in
            make.top.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints{(make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.centerX.equalTo(titleLabel)
        }
        
        imageView.snp.makeConstraints{(make) in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(12)
            make.height.width.equalTo(90)
            make.left.equalToSuperview().inset(16)
        }
        
        itemEngNameLabel.snp.makeConstraints{(make) in
            make.left.equalTo(imageView.snp.right).offset(15)
            make.top.equalTo(imageView).offset(18)
        }
        
        itemKorNameLabel.snp.makeConstraints{(make) in
            make.left.equalTo(itemEngNameLabel)
            make.top.equalTo(itemEngNameLabel.snp.bottom).offset(4)
        }
        
        sSizeButton.snp.makeConstraints{(make) in
            make.left.equalToSuperview().inset(16)
            make.top.equalTo(imageView.snp.bottom).offset(35)
            make.height.equalTo(50)
            make.width.equalTo(110)

        }
        
        mSizeButton.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(sSizeButton)
            make.height.equalTo(50)
            make.width.equalTo(110)


        }
        
        lSizeButton.snp.makeConstraints{(make) in
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(sSizeButton)
            make.height.equalTo(50)
            make.width.equalTo(110)

        }
        
        xlSizeButton.snp.makeConstraints{(make) in
            make.left.equalTo(sSizeButton)
            make.top.equalTo(sSizeButton.snp.bottom).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(110)

        }
        
        xxlSizeButton.snp.makeConstraints{(make) in
            make.top.equalTo(xlSizeButton)
            make.left.equalTo(mSizeButton)
            make.height.equalTo(50)
            make.width.equalTo(110)

        }
        
        quickBuyButton.snp.makeConstraints{(make) in
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.left.equalToSuperview().inset(16)
            make.height.equalTo(45)
            make.width.equalTo(170)
        }
        
        buyButton.snp.makeConstraints{(make) in
            make.bottom.equalTo(quickBuyButton)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(45)
            make.width.equalTo(170)


        }
        
        
    
    }

}
