//
//  SavedItemPageView.swift
//  Week3_Mission
//
//  Created by LEE on 2024/10/10.
//

import UIKit
import SnapKit

class SavedItemPageView: UIView {

    private lazy var titleView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subTitleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        
        return label
    }()
    
    public lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SavedItemCell.self, forCellReuseIdentifier: SavedItemCell.identifier)
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    public func updateCellCount(count: Int) {
        subTitleLabel.text = "전체 \(count)개"
    }
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setSubViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubViews(){
        self.addSubview(titleView)
        self.titleView.addSubview(self.titleLabel)
        self.titleView.addSubview(self.subTitleLabel)
        self.addSubview(self.tableView)
    }
    
    private func setConstraints(){
        titleView.snp.makeConstraints{(make) in
            make.top.equalTo(safeAreaLayoutGuide).inset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(70)
        }
        
        titleLabel.snp.makeConstraints{(make) in
            make.top.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(14)

        }
        
        subTitleLabel.snp.makeConstraints{(make) in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        tableView.snp.makeConstraints{(make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.left.right.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        
        
    }
    
    

}

