//
//  SavedImageView.swift
//  Kream_demo
//
//  Created by 황상환 on 10/7/24.
//

import Foundation
import UIKit
import SnapKit

class SavedImageView: UIView {
    
    // 데이터 개수를 위한 더미 데이터
    let data = dummySavedModels.savedDatas
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                self.backgroundColor = .white
        setViews()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold) // bold 추가
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var itemCountLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 \(data.count)개" // 전체 아이템 개수를 표시
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    public lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(SavedItemsCell.self, forCellReuseIdentifier: SavedItemsCell.identifier)
        table.separatorStyle = .singleLine
        return table
    }()
    
    private func setViews() {
        self.addSubview(title)
        self.addSubview(itemCountLabel)
        self.addSubview(tableView)
    }
    
    private func setConstaints() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.left.equalToSuperview().offset(10)
//            $0.right.equalToSuperview().offset(-183)
        }
        
        itemCountLabel.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(10)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(itemCountLabel.snp.bottom).offset(12)
            $0.left.right.bottom.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
