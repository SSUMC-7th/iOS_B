//
//  SizeButton.swift
//  Week6_Mission
//
//  Created by LEE on 2024/11/07.
//

import UIKit

class SizeButton: UIButton {
    
    
    let sizeLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    
    let priceLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .red
    }
    
    
    // MARK: - 이니셜라이저
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        layer.cornerRadius = 10
        layer.borderWidth = 0.2
        self.addComponents()
    }
    
    
    required init?(coder: NSCoder){
        fatalError("NSCoder Error")
    }
    
    
    private func addComponents(){
        addSubview(sizeLabel)
        addSubview(priceLabel)
        
        sizeLabel.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(8)
        }
        
        priceLabel.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(sizeLabel.snp.bottom).offset(2)
        }
        
        
    }
    
    
}
