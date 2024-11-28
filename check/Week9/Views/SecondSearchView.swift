//
//  SecondSearchView.swift
//  Week8_Mission
//
//  Created by LEE on 2024/11/22.
//

import UIKit

class SecondSearchView: UIView {

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
//    let searchLabel = UILabel().then{
//        $0.text = "   브랜드, 상품, 프로필, 태그 등"
//        $0.textColor = .lightGray
//        $0.font = .systemFont(ofSize: 14, weight: .light)
//        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
//        $0.layer.cornerRadius = 15
//        $0.clipsToBounds = true
//        $0.isUserInteractionEnabled = true
//    }
    
    let searchTextField = UITextField().then{
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .light)
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
    }
    
    let tableView = UITableView().then{
        $0.register(SearchItemCell.self, forCellReuseIdentifier: SearchItemCell.identifier)
        $0.separatorStyle = .none
    }
    // MARK: - 이니셜라이저
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
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
        self.headerView.addSubview(searchTextField)
        self.addSubview(tableView)
    }
    
    // MARK: - setConstraints 메소드
    private func setContstraints(){
        

        headerView.snp.makeConstraints{(make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.height.equalTo(60)
        }
        
        cancelButton.snp.makeConstraints{(make) in
            make.centerY.equalTo(searchTextField)
            make.right.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        searchTextField.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().inset(14)
            make.right.equalTo(cancelButton.snp.left)
            make.height.equalTo(40)
        
        }
        
        tableView.snp.makeConstraints{(make) in
            make.top.equalTo(headerView.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
       
    }
}
