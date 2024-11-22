//
//  ItemCell.swift
//  Week5_Mission
//
//  Created by LEE on 2024/10/31.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    static let identifier = "ItemCell"
    
    let titleLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
    }
    
    let subLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .black
        $0.numberOfLines = 2
        $0.lineBreakMode = .byTruncatingTail
    }
    
    let priceLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
    }
    
    let subPriceLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .gray
        $0.text = "즉시 구매가"
    }
    
    let imageView = UIImageView()
    
    override func prepareForReuse() {
        imageView.image = nil
        titleLabel.text = nil
        priceLabel.text = nil
    }
    
    func configure(model: ItemModel){
        imageView.image = UIImage(named: model.image)
        titleLabel.text = model.title
        subLabel.text = model.subTitle
        priceLabel.text = model.price 
    }
    
    required init?(coder: NSCoder) {
        fatalError("error!")
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setConstraints()
    }

    
    private func setViews(){
        self.addSubview(titleLabel)
        self.addSubview(imageView)
        self.addSubview(subLabel)
        self.addSubview(priceLabel)
        self.addSubview(subPriceLabel)
    }
    
    private func setConstraints(){
        imageView.snp.makeConstraints{(make) in
            make.width.height.equalTo(140)
            make.top.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{(make) in
            make.left.equalTo(imageView.snp.left).offset(6)
            make.top.equalTo(imageView.snp.bottom).offset(6)
        }
        
        subLabel.snp.makeConstraints{(make) in
            make.left.equalTo(imageView.snp.left).offset(6)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.height.equalTo(30)
            make.right.equalTo(imageView.snp.right).inset(6)
        }
        
        priceLabel.snp.makeConstraints{(make) in
            make.left.right.equalTo(imageView.snp.left).offset(6)
            make.top.equalTo(subLabel.snp.bottom).offset(26)
        }
    
        subPriceLabel.snp.makeConstraints{(make) in
            make.left.right.equalTo(imageView.snp.left).offset(6)
            make.top.equalTo(priceLabel.snp.bottom).offset(26)
        }
    }
}
