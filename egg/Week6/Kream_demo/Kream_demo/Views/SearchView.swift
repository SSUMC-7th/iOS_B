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
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    private func setupView() {
        let searchStackView = UIStackView(arrangedSubviews: [searchTextField, cancelButton])
        searchStackView.axis = .horizontal
        searchStackView.spacing = 8
        searchStackView.alignment = .fill
        
        addSubview(searchStackView)
        
        searchStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(40)
        }
    }
}
