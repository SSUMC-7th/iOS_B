//
//  HomeCollectionViewCell.swift
//  Kream
//
//  Created by 한금준 on 10/9/24.
//

import UIKit
import Then
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    /// 식별자 선언
    static let identifier: String = "HomeCollectionViewCell"
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 셀에 표시할 이미지 설정
    let imageView = UIImageView().then{
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    
    /// 셀에 표시할 타이틀 설정
    let titleLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.text = ""
    }
    
    /// 이미지와 타이틀 제약조건
    private func setupView(){
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview() 
            $0.width.height.equalTo(60)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(4)
            $0.bottom.equalToSuperview().offset(-4)
        }
    }
}
