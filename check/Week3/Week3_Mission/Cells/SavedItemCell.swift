//
//  SavedItemCell.swift
//  Week3_Mission
//
//  Created by LEE on 2024/10/10.
//

import UIKit

class SavedItemCell: UITableViewCell {

    
    static let identifier = "SavedItemCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setSubViews()
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("에러");
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.itemImageView.image = nil
        self.itemPriceLabel.text = nil
        self.itemTitleLabel.text = nil
        self.itemDescriptionLabel.text = nil
    }
    
    public func configure(model: SavedItemModel){
        self.itemTitleLabel.text = model.itemTitle
        self.itemImageView.image = UIImage(named: model.itemImage)
        self.itemDescriptionLabel.text = model.itemDescription
        self.itemPriceLabel.text = model.itemPrice
    }
    
    private lazy var itemImageView : UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var itemTitleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var itemDescriptionLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var itemPriceLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var itemBookmarkView : UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "bookmark.fill"))
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private func setSubViews(){
        self.addSubview(itemImageView)
        self.addSubview(itemTitleLabel)
        self.addSubview(itemDescriptionLabel)
        self.addSubview(itemPriceLabel)
        self.addSubview(itemBookmarkView)
    }
    
    
    private func setConstraints(){
        
        itemImageView.snp.makeConstraints{ (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(14)
            make.width.height.equalTo(72)
        }
        
        itemTitleLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(itemImageView.snp.top)
            make.left.equalTo(itemImageView.snp.right).offset(13)
            make.width.equalTo(150)
        }
        
        itemDescriptionLabel.snp.makeConstraints{(make) in
            make.left.equalTo(itemTitleLabel.snp.left)
            make.top.equalTo(itemTitleLabel.snp.top).offset(19)
            make.width.equalTo(150)

        }
        
        itemDescriptionLabel.snp.makeConstraints{(make) in
            make.left.equalTo(itemTitleLabel.snp.left)
            make.top.equalTo(itemTitleLabel.snp.top).offset(19)
        }
        
        itemBookmarkView.snp.makeConstraints{(make) in
            make.top.equalTo(itemImageView.snp.top)
            make.right.equalToSuperview().inset(14)
            make.width.height.equalTo(16)
            
        }
        
        itemPriceLabel.snp.makeConstraints{(make) in
            make.bottom.equalTo(itemImageView.snp.bottom)
            make.right.equalToSuperview().inset(14)
            
        }
    }
    
    
    
    
}
