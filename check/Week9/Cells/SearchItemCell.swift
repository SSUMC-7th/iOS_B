//
//  SearchItemCell.swift
//  Week8_Mission
//
//  Created by LEE on 2024/11/22.
//

import UIKit

class SearchItemCell: UITableViewCell {

    
    static let identifier = "SearchItemCell"
    
    let keywordLabel = UILabel().then{
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .regular)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("에러");
    }
    
    override func prepareForReuse() {
        self.keywordLabel.text = nil
    }
    
    
    func configure(with text: String){
        self.keywordLabel.text = text
    }

    func setViews(){
        self.addSubview(keywordLabel)
    }
    
    func setConstraints(){
        keywordLabel.snp.makeConstraints{(make) in
            make.left.equalToSuperview().inset(14)
            make.centerY.equalToSuperview()
        }
    }
}
