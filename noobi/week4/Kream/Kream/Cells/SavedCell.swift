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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstraints()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.savedImageView.image = nil
        self.savedName.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var savedImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var savedName: UILabel = {
        let name = UILabel()
        name.font = .systemFont(ofSize: 16, weight: .medium)
        name.textColor = .black
        return name
    }()
    
    private func setViews(){
        self.addSubview(savedImageView)
        self.addSubview(savedName)
    }
    
    private func setConstraints(){
        savedImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-16)
            $0.width.equalTo(120)
        }
        
        savedName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalTo(savedImageView.snp.right).offset(87)
            $0.right.equalToSuperview().offset(-16)
        }
    }
    
    public func configure(model: SavedModel){
        self.savedImageView.image = UIImage(named: model.savedImage)
        self.savedName.text = model.savedName
    }
}
