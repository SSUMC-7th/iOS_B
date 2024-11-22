//
//  SearchDetailView.swift
//  Kream
//
//  Created by 한금준 on 11/19/24.
//

import UIKit

class SearchDetailView: UIView {

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
        $0.spacing = 5 // 검색창과 취소 버튼 사이의 간격
        $0.alignment = .center
        $0.distribution = .fill
    }
    
    var backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.tintColor = .black
        $0.frame = CGRect(x: 0, y: 0, width: 50, height: 40) // 크기 조정
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

    private func setupView() {
        // 스택 뷰 설정
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10) // Safe Area 상단에 고정
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.lessThanOrEqualToSuperview().inset(10) // 화면 하단 여백 추가
        }
        
        // 상단 스택 뷰에 검색창과 취소 버튼 추가
        topStackView.addArrangedSubview(backButton)
        topStackView.addArrangedSubview(searchTextField)
        topStackView.addArrangedSubview(cancelButton)
        
        // 스택 뷰에 구성 요소 추가
        stackView.addArrangedSubview(topStackView)
        stackView.addArrangedSubview(dividedLine)
        
        // 검색창과 취소 버튼의 제약 조건
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
        }
        searchTextField.snp.makeConstraints {
            $0.height.equalTo(36)
            $0.width.equalTo(250)
        }
        
        cancelButton.snp.makeConstraints {
            $0.width.equalTo(50) // "취소" 버튼의 넓이를 적절히 설정
        }
        
        // 구분선의 제약 조건
        dividedLine.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
