//
//  RecommendationViewCell.swift
//  Week8_Mission
//
//  Created by LEE on 2024/11/22.
//

import UIKit

class RecommendationItemCell: UICollectionViewCell {
    
    static let identifier = "RecommendationItemCell"

    let label = UILabel().then{
        $0.font = .systemFont(ofSize: 14, weight: .light)
    }
    
    func configure(model : RecommendationItemModel){
        label.text = model.title
    }
    
    override func prepareForReuse() {
        label.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("error!")
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setConstraints()
        
        backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        self.layer.cornerRadius = 15

    }
    
    
    private func setViews(){
        self.addSubview(label)
    }
    
    private func setConstraints(){
        
        label.snp.makeConstraints{(make) in
            make.center.equalToSuperview()
        }
    }
}
