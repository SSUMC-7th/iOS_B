//
//  BuySheetView.swift
//  Kream_demo
//
//  Created by 황상환 on 11/7/24.
//

import Foundation
import UIKit

class BuySheetView: UIView {
    
    // MARK: - Properties
    private let titleLabel = UILabel().then {
        $0.text = "구매하기"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    private let subtitleLabel = UILabel().then {
        $0.text = "(가격 단위: 원)"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    let closeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .black
    }
    
    private let productImageView = UIImageView().then {
        $0.image = UIImage(named: "Main_black")
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    private let productNameLabel = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    private let productDescriptionLabel = UILabel().then {
        $0.text = "마떼킴 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = .gray
    }
    
    private let sizeStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 12
        $0.alignment = .leading // 왼쪽 정렬을 위해 추가
    }
    
    private let sizeRow1 = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 8
    }
    
    private let sizeRow2 = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
    }
    
    private let deliveryStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 12
    }
    
    private let sizes = ["S", "M", "L", "XL", "XXL"]
    var sizeButtons: [UIButton] = []
    var selectedSizeButton: UIButton?
    
    private let fastDeliveryButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 239/255, green: 98/255, blue: 83/255, alpha: 1)
        $0.layer.cornerRadius = 10
        
        // 스택뷰로 버튼 구성
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        
        let priceLabel = UILabel()
        priceLabel.text = "345,000"
        priceLabel.textColor = .white
        priceLabel.font = .systemFont(ofSize: 14)
        
        let titleLabel = UILabel()
        titleLabel.text = "빠른배송(1-2일 소요)"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 10)
        
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(titleLabel)
        
        $0.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    private let normalDeliveryButton = UIButton().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
        
        // 스택뷰로 버튼 구성
        let stackView = UIStackView()
        stackView.axis = .vertical  // vertical
        stackView.alignment = .center
        stackView.spacing = 4
        
        let priceLabel = UILabel()
        priceLabel.text = "407,000"
        priceLabel.textColor = .white
        priceLabel.font = .systemFont(ofSize: 14)
        
        let titleLabel = UILabel()
        titleLabel.text = "일반배송(5-7일 소요)"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 10)
        
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(titleLabel)
        
        $0.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
        setupSizeButtons()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupLayout() {
        [titleLabel, subtitleLabel, closeButton, productImageView,
         productNameLabel, productDescriptionLabel, sizeStackView,
         deliveryStackView].forEach {
            addSubview($0)
        }
        
        [sizeRow1, sizeRow2].forEach {
            sizeStackView.addArrangedSubview($0)
        }
        
        [fastDeliveryButton, normalDeliveryButton].forEach {
            deliveryStackView.addArrangedSubview($0)
        }
    }
    
    private func setupSizeButtons() {
        sizeButtons = sizes.map { size in
            let button = UIButton()
            
            // 버튼 스택 뷰
            let stackView = UIStackView()
            stackView.isUserInteractionEnabled = false
            stackView.axis = .vertical
            stackView.alignment = .center
            stackView.spacing = 4
            
            let sizeLabel = UILabel()
            stackView.isUserInteractionEnabled = false
            sizeLabel.text = size
            sizeLabel.textColor = .black
            sizeLabel.font = .systemFont(ofSize: 14)
            
            let priceLabel = UILabel()
            stackView.isUserInteractionEnabled = false
            priceLabel.text = "360,000"
            priceLabel.textColor = .red
            priceLabel.font = .systemFont(ofSize: 14)
            
            stackView.addArrangedSubview(sizeLabel)
            stackView.addArrangedSubview(priceLabel)
            
            button.addSubview(stackView)
            stackView.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
            
            button.backgroundColor = .white
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.cornerRadius = 8
            
            // 버튼 크기
            button.snp.makeConstraints {
                $0.width.equalTo(110)
                $0.height.equalTo(50)
            }
            
            return button
        }
        
        // 버튼 3개
        for i in 0..<3 {
            sizeRow1.addArrangedSubview(sizeButtons[i])
        }
        
        // 나머지 버튼 2개
        for i in 3..<sizeButtons.count {
            sizeRow2.addArrangedSubview(sizeButtons[i])
        }
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.size.equalTo(24)
        }
        
        productImageView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(80)
        }
        
        productNameLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.top)
            $0.leading.equalTo(productImageView.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        productDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(productNameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(productNameLabel)
            $0.trailing.equalTo(productNameLabel)
        }
        
        sizeStackView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        // First row width constraint
        sizeRow1.snp.makeConstraints {
            $0.width.equalTo(sizeStackView)
        }
        
        deliveryStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-34)
            $0.height.equalTo(50)
        }
    }
}
