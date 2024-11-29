//
//  SearchCollectionViewCell.swift
//  Kream
//
//  Created by 한금준 on 11/19/24.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    /// 식별자 지정
    static let identifier = "SearchCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 버튼 생성 및 설정
    let suggestButton = UIButton().then {
        $0.setTitle("", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = UIColor(white: 0.95, alpha: 1) // 배경색 설정
        $0.layer.cornerRadius = 10
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        $0.clipsToBounds = true
    }
    
    // 뷰 설정 메서드
    private func setupView() {
        contentView.addSubview(suggestButton)
        
        // suggestButton의 제약 조건 설정
        suggestButton.snp.makeConstraints { make in
            make.edges.equalToSuperview() // 셀 전체를 채우도록 설정
        }
    }
    
    // 버튼 타이틀을 설정하는 메서드
    func configure(with model: SearchModel) {
        suggestButton.setTitle(model.suggest, for: .normal) // 버튼의 타이틀 설정
    }
}
