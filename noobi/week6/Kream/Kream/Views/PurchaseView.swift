//
//  PurchaseView.swift
//  Kream
//
//  Created by 한금준 on 11/6/24.
//

import UIKit

class PurchaseView: UIView {
    
    // 코드에서 뷰를 생성할 수 있도록.
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupBottomBar()
    }
    
    // 스토리보드 사용할 경우 지원하지 않도록.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    /// 닫기 버튼
    let closeButton = UIButton(type: .system).then {
        $0.setTitle("X", for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        $0.tintColor = .black
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    
    /// buyTitle
    let buyTitleLabel = UILabel().then { make in
        make.text = "구매하기"
        make.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        make.textColor = .black
    }
    
    /// butSubtitle
    let buySubTitleLabel = UILabel().then { make in
        make.text = "(가격 단위: 원)"
        make.font = UIFont.systemFont(ofSize: 13, weight: .light)
        make.textColor = .gray
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    /// 물건 사진
    let productImageView = UIImageView().then { make in
        make.contentMode = .scaleAspectFill
        make.clipsToBounds = true
        make.layer.cornerRadius = 8
        make.image = UIImage(named: "clothes1")
    }
    
    /// titleLabel
    let titleLabel = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
    }
    
    /// descriptionLabel
    let descriptionLabel = UILabel().then {
        $0.text = "마땡김 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    /// textStackView
    let textStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 4
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    // 구분 선
    private let lineView = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    let bottomBarView = UIView()
    
    let fastBuyButton = UIButton.createStyledButton(
        price: "345,000",
        subtitle: "빠른배송(1~2일 소요)",
        backgroundColor: UIColor(red: 0.9, green: 0.3, blue: 0.3, alpha: 1.0)
    )
    
    let normalBuyButton = UIButton.createStyledButton(
        price: "407,000",
        subtitle: "일반배송(5~7일 소요)",
        backgroundColor: UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
    )
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    private let sizes = ["S", "M", "L", "XL", "XXL"]
    private let price = "360,000"
    private var selectedButton: UIButton?
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 10
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    private func setupView() {
        // 닫기 버튼 추가
        addSubview(closeButton)
        addSubview(buyTitleLabel)
        addSubview(buySubTitleLabel)
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.self).offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        buyTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
        }
        buySubTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(buyTitleLabel.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
        }
        
        addSubview(productImageView)
        addSubview(textStackView)
        
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(descriptionLabel)
        
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(buySubTitleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(110) // 이미지 크기 설정
        }
        
        textStackView.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.trailing).offset(16)
            make.centerY.equalTo(productImageView.snp.top).offset(30) // 텍스트가 이미지와 수평 정렬되도록 설정
            make.trailing.equalToSuperview().offset(-16)
        }
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        // 상단 줄과 하단 줄을 위한 수평 스택 뷰
        let topRowStackView = createHorizontalStackView()
        let bottomRowStackView = createHorizontalStackView()
        
        stackView.addArrangedSubview(topRowStackView)
        stackView.addArrangedSubview(bottomRowStackView)
        
        // 더미 버튼 생성 및 숨기기
        let dummyButton = UIButton()
        dummyButton.isUserInteractionEnabled = false // 클릭 불가하게 설정
        dummyButton.alpha = 0 // 투명하게 설정하여 화면에 보이지 않도록 함
        bottomRowStackView.addArrangedSubview(dummyButton)
        dummyButton.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(60)
        }
        
        // 버튼 생성 및 배치
        for (index, size) in sizes.enumerated() {
            let button = createSizeButton(with: size, price: price)
            button.tag = index
            button.addTarget(self, action: #selector(didTapSizeButton(_:)), for: .touchUpInside)
            
            // 첫 3개 버튼은 상단 줄에, 나머지 3개 버튼은 하단 줄에 추가
            if index < 3 {
                topRowStackView.addArrangedSubview(button)
            } else {
                bottomRowStackView.addArrangedSubview(button)
            }
            
            button.snp.makeConstraints { make in
                make.width.equalTo(80)
                make.height.equalTo(60)
            }
        }
        
        addSubview(lineView)
        // 구분선 설정
        lineView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-100)
            $0.leading.trailing.equalToSuperview()  // 화면 전체 너비
            $0.height.equalTo(1)  // 높이 1포인트
        }
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    private func setupBottomBar() {
        
        // 하단 바 컨테이너 뷰 생성
        let bottomBarView = UIView()
        addSubview(bottomBarView)
        bottomBarView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.self)
            make.height.equalTo(70)
        }
        
        // 버튼들을 StackView에 추가
        let buttonStack = UIStackView(arrangedSubviews: [fastBuyButton, normalBuyButton]).then { make in
            make.axis = .horizontal
            make.spacing = 12
            make.distribution = .fillEqually
        }
        
        bottomBarView.addSubview(buttonStack)
        
        buttonStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
        }
        
        // buyButton의 고정 너비 설정
        fastBuyButton.snp.makeConstraints { make in
            make.width.equalTo(150) // 원하는 너비로 설정
        }
        // buyButton의 고정 너비 설정
        normalBuyButton.snp.makeConstraints { make in
            make.width.equalTo(150) // 원하는 너비로 설정
        }
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    private func createHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    private func createSizeButton(with size: String, price: String) -> UIButton {
        let button = UIButton(type: .system)
        
        // 두 줄의 텍스트를 표시하기 위해 NSAttributedString 사용
        let attributedText = NSMutableAttributedString(
            string: "\(size)\n",
            attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .bold), .foregroundColor: UIColor.black]
        )
        attributedText.append(NSAttributedString(
            string: price,
            attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.red]
        ))
        
        button.setAttributedTitle(attributedText, for: .normal)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.backgroundColor = .white
        
        
        return button
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    @objc private func didTapSizeButton(_ sender: UIButton) {
        /// 이전에 선택된 버튼의 스타일 초기화
        selectedButton?.layer.borderColor = UIColor.lightGray.cgColor
        selectedButton?.setTitleColor(.black, for: .normal)
        
        /// 현재 선택된 버튼의 스타일 변경
        sender.layer.borderColor = UIColor.black.cgColor
        sender.setTitleColor(.black, for: .normal)
        
        selectedButton = sender
    }
    
}

// ------------------------------------------------------------------------------------------------------------------------

extension UIButton {
    static func createStyledButton(price: String, subtitle: String, backgroundColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        // Attributed String 생성
        let attributedText = NSMutableAttributedString()
        
        /// 가격 텍스트
        let priceAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 16),
            .foregroundColor: UIColor.white
        ]
        let priceAttributedText = NSAttributedString(string: "\(price)\n", attributes: priceAttributes)
        attributedText.append(priceAttributedText)
        
        /// 서브타이틀 텍스트 (오른쪽 아래에 위치할 듯한 느낌으로 추가)
        let subtitleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.white.withAlphaComponent(0.8)
        ]
        let subtitleAttributedText = NSAttributedString(string: subtitle, attributes: subtitleAttributes)
        attributedText.append(subtitleAttributedText)
        
        /// 버튼에 AttributedTitle 설정
        button.setAttributedTitle(attributedText, for: .normal)
        
        /// 버튼 텍스트의 정렬 및 여백 설정
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center // 수직 가운데 정렬
        
        return button
    }
}

