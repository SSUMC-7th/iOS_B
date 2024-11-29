//
//  ActionButton.swift
//  Week6_Mission
//
//  Created by LEE on 2024/11/07.
//

import UIKit

class ActionButton: UIButton {

    
    let leftLabel = UILabel().then{
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    let subLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 10, weight: .medium)
    }
    
    let priceLabel = UILabel().then{
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    // MARK: - 이니셜라이저
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        layer.cornerRadius = 10
        self.addComponents()
    }
    
    
    required init?(coder: NSCoder){
        fatalError("NSCoder Error")
    }
    
    
    private func addComponents(){
        
        addSubview(leftLabel)
        addSubview(subLabel)
        addSubview(priceLabel)
        
        leftLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(10)
        }
        
        priceLabel.snp.makeConstraints{ make in
            make.right.equalToSuperview().inset(35)
            make.top.equalToSuperview().inset(8)
        }
        
        subLabel.snp.makeConstraints{ make in
            make.top.equalTo(priceLabel.snp.bottom).offset(2)
            make.left.equalTo(priceLabel)
        }
        
    }

}
