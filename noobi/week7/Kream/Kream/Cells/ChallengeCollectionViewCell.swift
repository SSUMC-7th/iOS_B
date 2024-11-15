//
//  ChallengeCollectionViewCell.swift
//  Kream
//
//  Created by 한금준 on 10/31/24.
//

import UIKit
import SnapKit

class ChallengeCollectionViewCell: UICollectionViewCell {
    /// 식별자 지정
    static let identifier = "ChallengeCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 이미지와 이름을 표시할 UI 요소 생성
    let imageView = UIImageView().then { make in
        make.contentMode = .scaleAspectFill
        make.clipsToBounds = true
        make.layer.cornerRadius = 8
    }
    
    let nameLabel = UILabel().then { make in
        make.font = UIFont.systemFont(ofSize: 12)
        make.textColor = .white
        make.backgroundColor = .clear
        make.textAlignment = .left
        make.clipsToBounds = true
    }
    
    // UI 요소를 추가하고 제약 조건 설정
    private func setupView() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // 이미지가 셀을 꽉 채우도록 설정
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(8)
            make.trailing.bottom.equalToSuperview() // 이름이 하단에 배치되도록 설정
            make.height.equalTo(20)// 이름 라벨 높이 설정
        }
    }
    
    // 데이터 바인딩 메서드
    func configure(with model: ChallengeModel) {
        imageView.image = model.savedImage
        nameLabel.text = model.name
    }
}
