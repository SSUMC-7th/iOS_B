//
//  SavedItemsCell.swift
//  Kream_demo
//
//  Created by 황상환 on 10/7/24.
//

import UIKit

class SavedItemsCell: UITableViewCell {
    
    static let identifier = "SavedItemsCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.savedImageView.image = nil
        self.savedTitle.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var savedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var savedTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var savedInfo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.gray
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var savedBookmark: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bookmark")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var savedPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor.black
        
        // 금액 텍스트 기준 오른쪽 정렬
        label.textAlignment = .right
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private func setViews() {
        self.addSubview(savedImageView)
        self.addSubview(savedTitle)
        self.addSubview(savedInfo)
        self.addSubview(savedPrice)
        self.addSubview(savedBookmark)
    }
    
    private func setConstraints() {
        savedImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalToSuperview().offset(13)
            $0.width.height.equalTo(72)
            $0.bottom.lessThanOrEqualToSuperview().offset(-15)
        }
        
        savedTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalTo(savedImageView.snp.right).offset(13)
            $0.right.equalToSuperview().offset(-12)
        }
        
        savedInfo.snp.makeConstraints {
            $0.top.equalTo(savedTitle.snp.bottom).offset(4)
            $0.left.equalTo(savedTitle)
            $0.right.equalToSuperview().offset(-12)
        }
        
        savedBookmark.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.right.equalToSuperview().offset(-17)
            $0.width.equalTo(14)
            $0.height.equalTo(18)
        }
        
        savedPrice.snp.makeConstraints {
            $0.centerY.equalTo(savedBookmark.snp.bottom).offset(31)
            $0.right.equalToSuperview().offset(-16)
            $0.width.lessThanOrEqualTo(100)
        }
        
        
    }
    
    public func configure(model: SavedModels) {
        self.savedImageView.image = UIImage(named: model.SavedImage)
        self.savedTitle.text = model.SavedTitle
        self.savedInfo.text = model.SavedInfo
        self.savedPrice.text = model.SavedPrice
    }
    
}
