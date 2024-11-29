//
//  SearchDetailView.swift
//  Kream_demo
//
//  Created by 황상환 on 11/20/24.
//

import Foundation
import UIKit
import SnapKit
import Then

class SearchDetailView: UIView {
    
    // MARK: - Properties
    
    let cancelArrowButton = UIButton().then{
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.tintColor = .black
    }
    
    let searchTextField = UITextField().then {
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.borderStyle = .none
        $0.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        $0.layer.cornerRadius = 10
        $0.font = UIFont.systemFont(ofSize: 13.5)
        $0.clipsToBounds = true
        
        // placeholder 패딩
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: $0.frame.height))
        $0.leftView = paddingView
        $0.leftViewMode = .always
    }

    // 취소 버튼
    let cancelButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let resultSearchView = UITableView().then {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "SearchResultCell")
            $0.backgroundColor = .white
            $0.separatorStyle = .singleLine
        }

    
    // MARK: - INIT
    override init(frame: CGRect) {
       super.init(frame: frame)
       backgroundColor = .white
        
       setupView()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    // MARK: - SETUP
    
    private func setupView() {
        let searchStackView = UIStackView(arrangedSubviews: [cancelArrowButton, searchTextField, cancelButton])
        searchStackView.axis = .horizontal
        searchStackView.spacing = 8
        searchStackView.alignment = .fill // 이놈이 중요함
        
        [searchStackView, resultSearchView].forEach { addSubview($0) }
        
        // 검색창
        searchStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(40)
        }
        
        // 검색창 왼쪽 뒤로가기 버튼
        cancelArrowButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        
        // 검색 결과 탭뷰
        resultSearchView.snp.makeConstraints {
            $0.top.equalTo(searchStackView.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        
    }
}

