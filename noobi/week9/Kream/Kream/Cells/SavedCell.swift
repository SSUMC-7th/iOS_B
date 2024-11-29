//
//  SavedCell.swift
//  Kream
//
//  Created by 한금준 on 10/6/24.
//

import UIKit
import SnapKit

class SavedCell: UITableViewCell {
    static let identifier = "SavedCell"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.savedImageView.image = nil
        self.describeLabel.text = nil
        self.brandLabel.text = nil
        self.priceLabel.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // UI Components
    let savedImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
    }
    
    let brandLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        $0.textColor = .black
        $0.numberOfLines = 1
    }
    
    let describeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .gray
        $0.numberOfLines = 2 // 두 줄까지 표시
    }
    
    let bookmarkButton = UIButton().then { make in
        make.setImage(UIImage(systemName: "bookmark"), for: .normal)
        make.tintColor = .black
    }
    
    let priceLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
        
        $0.textAlignment = .right
        $0.numberOfLines = 1
        $0.adjustsFontSizeToFitWidth = true
        $0.minimumScaleFactor = 0.5
    }
    
    private func setupViews() {
        // Add subviews
        contentView.addSubview(savedImageView)
        contentView.addSubview(describeLabel)
        contentView.addSubview(brandLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(bookmarkButton)
        
        // Set constraints
        savedImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.left.equalToSuperview().offset(13)
            make.width.height.equalTo(72)
            make.bottom.lessThanOrEqualToSuperview().offset(-15)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.left.equalTo(savedImageView.snp.right).offset(13)
            make.right.equalToSuperview().offset(-12)
        }
        
        describeLabel.snp.makeConstraints { make in
            make.top.equalTo(brandLabel.snp.bottom).offset(4)
            make.leading.equalTo(brandLabel)
            make.trailing.equalTo(priceLabel.snp.leading).offset(-8)
            
        }
        bookmarkButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18) // 상단에서 18pt 떨어지도록 설정
            $0.right.equalToSuperview().offset(-17) // 오른쪽 끝에 배치
            $0.width.equalTo(14)
            $0.height.equalTo(18)
        }
        
        
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(bookmarkButton.snp.bottom).offset(30)
            make.trailing.equalToSuperview().inset(12)
        }
    }
    
    // Configure cell with SavedModel data
    func configure(with model: SavedModel) {
        savedImageView.image = UIImage(named: model.savedImage)
        brandLabel.text = model.brand
        describeLabel.text = model.describe
        priceLabel.text = model.price
    }
}
