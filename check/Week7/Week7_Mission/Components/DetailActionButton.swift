//
//  ActionButton.swift
//  Week6_Mission
//
//  Created by LEE on 2024/11/07.
//

import UIKit

class DetailActionButton: UIButton {
    
    let subLabel = UILabel().then{
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 10, weight: .light)
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
        
        addSubview(subLabel)
        addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(8)
        }
        
        subLabel.snp.makeConstraints{ make in
            make.top.equalTo(priceLabel.snp.bottom).offset(2)
            make.centerX.equalTo(priceLabel)
        }
        
    }

}
