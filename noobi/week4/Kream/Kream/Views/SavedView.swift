//
//  SavedViewController.swift
//  Kream
//
//  Created by 한금준 on 10/2/24.
//

import UIKit
import SnapKit

class SavedView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    // 스토리보드 사용할 경우 지원하지 않도록.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = .systemFont(ofSize: .init(28))
        label.textColor = .black
        return label
    }()
    
    public lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        table.separatorStyle = .singleLine
        return table
    }()
    
    private lazy var subtitle: UILabel = {
        let subLabel = UILabel()
        subLabel.font = .systemFont(ofSize: .init(14))
        subLabel.textColor = .lightGray
        return subLabel
    }()
    
    private func setupView(){
        self.addSubview(title)
        self.addSubview(tableView)
        self.addSubview(subtitle)
    }
    
    private func setupConstraints(){
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-183)
        }
        subtitle.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(14)
            $0.left.equalToSuperview().offset(20)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(subtitle.snp.bottom).offset(14)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    // 데이터의 개수에 따라 subtitle 업데이트
    public func updateSubtitle(with count: Int) {
        subtitle.text = "전체 \(count)개"
    }

}
