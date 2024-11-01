//
//  CategoryCell.swift
//  Week4_Mission
//
//  Created by LEE on 2024/10/11.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let identifier = "CategoryCell"
    
    let titleLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
    }
    
    let imageView = UIImageView()
    
    override func prepareForReuse() {
        imageView.image = nil
        titleLabel.text = nil
    }
    
    func configure(model: CategoryModel){
        imageView.image = UIImage(named: model.image)
        titleLabel.text = model.title
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
    }
    
    private func setConstraints(){
        imageView.snp.makeConstraints{(make) in
            make.width.height.equalTo(60)
            make.top.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(6)
        }
        
    }
}
