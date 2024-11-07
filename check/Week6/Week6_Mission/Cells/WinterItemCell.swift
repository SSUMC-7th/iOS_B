//
//  WinterItemCell.swift
//  Week5_Mission
//
//  Created by LEE on 2024/10/31.
//

import UIKit

class WinterItemCell: UICollectionViewCell {
    
    static let identifier = "WinterItemCell"
    
    let imageView = UIImageView()
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    func configure(model: WinterItemModel){
        imageView.image = UIImage(named: model.image)
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
        self.addSubview(imageView)
    }
    
    private func setConstraints(){
        imageView.snp.makeConstraints{(make) in
            make.width.equalTo(120)
            make.height.equalTo(160)
            make.top.equalToSuperview()
        }
    }
}
