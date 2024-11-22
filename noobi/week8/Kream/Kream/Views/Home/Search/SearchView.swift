//
//  SearchView.swift
//  Kream
//
//  Created by 한금준 on 11/19/24.
//

import UIKit
import SnapKit
import Then

class SearchView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 수직 방향의 스택 뷰로 구성, 각 구성 요소를 세로로 정렬
    let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .fill
        $0.distribution = .fill
    }
    
    /// 수평 방향의 상단 스택 뷰, 검색창과 취소 버튼을 포함
    let topStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8 // 검색창과 취소 버튼 사이의 간격
        $0.alignment = .center
        $0.distribution = .fill
    }
    
    /// 검색창 텍스트 필드
    let searchTextField = UITextField().then {
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.backgroundColor = UIColor(white: 0.95, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.font = UIFont.systemFont(ofSize: 13.5)
        $0.textColor = .black
        $0.clipsToBounds = true
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftView = paddingView
        $0.leftViewMode = .always
    }
    
    /// 취소 버튼
    let cancelButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }
    
    /// 구분선
    private let dividedLine = UIView().then {
        $0.backgroundColor = .lightGray.withAlphaComponent(0.3)
    }
    
    /// 제목 레이블 생성
    let suggestTitleLabel = UILabel().then {
        $0.text = "추천 검색어"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{ make in
        let numberOfItemsPerRow: CGFloat = 3
        let spacing: CGFloat = 10 // 셀 사이의 간격 설정
        
        let totalSpacing = spacing * (numberOfItemsPerRow - 1) // 총 간격
        let itemWidth = (UIScreen.main.bounds.width - totalSpacing) / numberOfItemsPerRow
        
        make.itemSize = CGSize(width: itemWidth, height: itemWidth + 30) // 이미지와 텍스트를 포함한 높이 설정
        make.minimumInteritemSpacing = spacing
        make.minimumLineSpacing = spacing
        make.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }).then{ layout in
        layout.backgroundColor = .clear
        layout.isScrollEnabled = false
        layout.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
    }
    
    private func setupView() {
        // 스택 뷰 설정
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10) // Safe Area 상단에 고정
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.lessThanOrEqualToSuperview().inset(10) // 화면 하단 여백 추가
        }
        
        // 상단 스택 뷰에 검색창과 취소 버튼 추가
        topStackView.addArrangedSubview(searchTextField)
        topStackView.addArrangedSubview(cancelButton)
        
        // 스택 뷰에 구성 요소 추가
        stackView.addArrangedSubview(topStackView)
        stackView.addArrangedSubview(dividedLine)
        stackView.addArrangedSubview(suggestTitleLabel)
        stackView.addArrangedSubview(collectionView)
        
        // 검색창과 취소 버튼의 제약 조건
        searchTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(36)
            $0.width.equalTo(250)
        }
        
        cancelButton.snp.makeConstraints {
            $0.width.equalTo(50)
        }
        
        // 구분선의 제약 조건
        dividedLine.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        stackView.setCustomSpacing(30, after: dividedLine)
        
        suggestTitleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().offset(10)
        }
        
        stackView.setCustomSpacing(10, after: suggestTitleLabel)
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
    }
}
