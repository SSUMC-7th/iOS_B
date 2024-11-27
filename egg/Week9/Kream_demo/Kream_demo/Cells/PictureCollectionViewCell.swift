//
//  PictureCollectionViewCell.swift
//  Kream_demo
//
//  Created by 황상환 on 11/1/24.
//

import Foundation
import UIKit
import Kingfisher

class PictureCollectionViewCell: UICollectionViewCell {
    static let identifier = "PictureCollectionViewCell"
    
    // 이미지 뷰
    private let pictureImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12
    }
    
    // 닉네임 뷰
    private let userNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(pictureImageView)
        addSubview(userNameLabel)
        
        // 사진 이미지 뷰
        pictureImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        // 닉네임 라벨
        userNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().offset(-12)
        }
    }
    
    // configure 방식 수정
    func configure(with model: PictureModel) {
        if let url = URL(string: model.imageURL) {
            pictureImageView.kf.setImage(
                with: url,
                placeholder: UIImage(systemName: "photo"),
                options: [
                    .transition(.fade(0.2))
                ]
            )
        }
        userNameLabel.text = model.userName
    }
}
