//
//  DifferentColorCell.swift
//  Week6_Mission
//
//  Created by LEE on 2024/11/07.
//

import UIKit

class DifferentColorCell: UICollectionViewCell {
    
    static let identifier = "DifferentColorCell"

    let imageView = UIImageView()
    
    
    func configure(model : DetailItemModel){
        imageView.image = UIImage(named: model.image)
    }
    
    override func prepareForReuse() {
        imageView.image = nil
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
        imageView.snp.makeConstraints{ (make) in
            make.edges.equalToSuperview()
        }
    }
    
    
    
    
}
