//
//  SearchView.swift
//  Kream_demo
//
//  Created by 황상환 on 10/11/24.
//

import Foundation
import UIKit
import SnapKit
import Then

class SearchView: UIView {
        
    // MARK: - Properties

    // 검색창
    let searchTextField = UITextField().then {
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.borderStyle = .none
        $0.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        $0.layer.cornerRadius = 10
        $0.font = UIFont.systemFont(ofSize: 13.5)
        $0.clipsToBounds = true
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftView = paddingView
        $0.leftViewMode = .always
    }

    // 취소 버튼
    let cancelButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    // 추천 검색어 라벨
    let recomandWordLabel = UILabel().then {
        $0.text = "추천 검색어"
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.textColor = .black
    }
    
    // 추천 검색어 collection
    let recommendCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8  // 가로 간격
        layout.minimumLineSpacing = 8       // 세로 간격
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    
    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupView() {
        let searchStackView = UIStackView(arrangedSubviews: [searchTextField, cancelButton])
        searchStackView.axis = .horizontal
        searchStackView.spacing = 8
        searchStackView.alignment = .fill
        
//        addSubview(searchStackView)
//        addSubview(recomandWordLabel)
        // 더 간단하게
        [searchStackView, recomandWordLabel, recommendCollectionView].forEach { addSubview($0) }
        
        // 검색창
        searchStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(40)
        }
        
        // 추천 검색어 라벨
        recomandWordLabel.snp.makeConstraints {
            $0.top.equalTo(searchStackView.snp.bottom).offset(41)
            $0.leading.equalToSuperview().offset(16)
        }
        
        // 추천 검색어 컬렉션
        recommendCollectionView.snp.makeConstraints {
            $0.top.equalTo(recomandWordLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(120)
            $0.width.equalTo(UIScreen.main.bounds.width - 32)  // 너비 명시적 지정
        }
        
        
    }
}
