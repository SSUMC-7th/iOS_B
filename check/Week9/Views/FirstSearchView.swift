//
//  FirstSearchView.swift
//  Week8_Mission
//
//  Created by LEE on 2024/11/22.
//

import UIKit

class FirstSearchView: UIView {

    // MARK: - UIComponents
    
    // 헤더 뷰
    // 검색 레이블, 알람 이미지, 세그먼트 컨트롤을 포함
    let headerView = UIView().then{
        $0.backgroundColor = .white
    }
    
    // 취소 버튼
    let cancelButton = UILabel().then{
        $0.text = "취소"
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.textColor =  .black
        $0.textAlignment = .center
        $0.isUserInteractionEnabled = true
    }
    
    // 검색 레이블
    let searchLabel = UILabel().then{
        $0.text = "   브랜드, 상품, 프로필, 태그 등"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 14, weight: .light)
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
        
    }
    
    let recommendationLabel = UILabel().then{
        $0.text = "추천 검색어"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.itemSize = .init(width: 110, height: 32)
        // $0.estimatedItemSize = .init(width: 110, height: 36)
        $0.minimumLineSpacing = 10
        $0.scrollDirection = .horizontal
    
    }).then{
        $0.register(RecommendationItemCell.self, forCellWithReuseIdentifier: RecommendationItemCell.identifier)
        $0.backgroundColor = .white
    }
    
    // MARK: - 이니셜라이저
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setContstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }

    
    // MARK: - setViews 메소드
    private func setViews(){

        self.addSubview(headerView)
        self.headerView.addSubview(cancelButton)
        self.headerView.addSubview(searchLabel)
        
        self.addSubview(recommendationLabel)
        self.addSubview(collectionView)
        
    }
    
    // MARK: - setConstraints 메소드
    private func setContstraints(){
        

        headerView.snp.makeConstraints{(make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.height.equalTo(90)
        }
        
        cancelButton.snp.makeConstraints{(make) in
            make.centerY.equalTo(searchLabel)
            make.right.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        searchLabel.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().inset(14)
            make.right.equalTo(cancelButton.snp.left)
            make.height.equalTo(40)
        
        }
        
        recommendationLabel.snp.makeConstraints{(make) in
            make.left.equalToSuperview().inset(14)
            make.top.equalTo(searchLabel.snp.bottom).offset(40)
        }
        
        collectionView.snp.makeConstraints{(make) in
            make.top.equalTo(recommendationLabel.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.left.equalTo(recommendationLabel)
            make.height.equalTo(80)
        }
    }
}
