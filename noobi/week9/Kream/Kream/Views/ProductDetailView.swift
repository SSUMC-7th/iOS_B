//
//  ProductDetailView.swift
//  Kream
//
//  Created by 한금준 on 11/4/24.
//

import UIKit

class ProductDetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupBottomBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    let imageView = UIImageView().then { make in
        make.contentMode = .scaleAspectFill
        make.image = UIImage(named: "clothes1")
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    /// ProductDetail 컬렉션 뷰 설정
    let productDetailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal /// 수평 스크롤
        $0.minimumLineSpacing = 8
        $0.itemSize = CGSize(width: 50, height: 100) // 이미지 크기 설정
    }).then{
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.register(ProductDetailCollectionViewCell.self, forCellWithReuseIdentifier: ProductDetailCollectionViewCell.identifier)
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    /// price title과 가격
    let priceTitleLabel = UILabel().then { make in
        make.text = "즉시 구매가"
        make.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        make.textColor = .gray
    }
    
    let priceLabel = UILabel().then { make in
        make.text = "228,000원"
        make.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        make.textColor = .black
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    /// product title과  subtitle 레이블
    let productTitleLabel = UILabel().then { make in
        make.text = "Matin Kim Logo Coating Jumper"
        make.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        make.textColor = .black
    }
    
    let productSubtitleLabel = UILabel().then { make in
        make.text = "발매 상품"
        make.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        make.textColor = .gray
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    /// 구분 선
    private let lineView = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    /// 북마크 및 숫자
    let bookmarkIcon = UIImageView().then { make in
        make.image = UIImage(systemName: "bookmark")
        make.tintColor = .black
    }
    let bookmarkLabel = UILabel().then { make in
        make.text = "2,122"
        make.font = UIFont.systemFont(ofSize: 14)
        make.textColor = .black
    }
    
    /// 구매 및 판매 버튼
    let buyButton = UIView.createCustomButton(
        leftText: "구매",
        rightText: "345,000",
        subtitleText: "즉시 구매가",
        backgroundColor: UIColor(red: 0.9, green: 0.3, blue: 0.3, alpha: 1.0)
    )
    
    let sellButton = UIView.createCustomButton(
        leftText: "판매",
        rightText: "396,000",
        subtitleText: "즉시 판매가",
        backgroundColor: UIColor(red: 0.3, green: 0.7, blue: 0.3, alpha: 1.0)
    )
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    /// 레이아웃 제약 조건
    private func setupViews() {
        
        addSubview(imageView)
        addSubview(productDetailCollectionView)
        addSubview(priceTitleLabel)
        addSubview(priceLabel)
        addSubview(productTitleLabel)
        addSubview(productSubtitleLabel)
        addSubview(lineView)
        
        /// 이미지 뷰 설정
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(imageView.snp.width)
        }
        
        /// productDetail 컬렉션 뷰 설정
        productDetailCollectionView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().offset(10)
            make.height.equalTo(100)
        }
        
        /// priceTitle 설정
        priceTitleLabel.snp.makeConstraints {
            $0.top.equalTo(productDetailCollectionView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        /// priceSubtitle 설정
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(priceTitleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(10)
        }
        
        /// productTitle 설정
        productTitleLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
    
        /// productSubtitle 설정
        productSubtitleLabel.snp.makeConstraints {
            $0.top.equalTo(productTitleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(10)
        }
        
        // 구분선 설정
        lineView.snp.makeConstraints {
            $0.top.equalTo(productSubtitleLabel.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview()  // 화면 전체 너비
            $0.height.equalTo(1)  // 높이 1포인트
        }
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    /// 하단에 북마크 및 2개 버튼이 있는 바 레이아웃 제약조건
    private func setupBottomBar() {
        
        // 하단 바 컨테이너 뷰 생성
        let bottomBarView = UIView()
        
        addSubview(bottomBarView)
        bottomBarView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.self)
            make.height.equalTo(70)
        }
        
        // 북마크 및 숫자
        let bookmarkStack = UIStackView(arrangedSubviews: [bookmarkIcon, bookmarkLabel]).then {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 4
        }
        
        bottomBarView.addSubview(bookmarkStack)
        bookmarkStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
        
        /// 버튼들을 StackView에 추가
        let buttonStack = UIStackView(arrangedSubviews: [buyButton, sellButton]).then { make in
            make.axis = .horizontal
            make.spacing = 12
            make.distribution = .fillEqually
        }
        
        /// bottomBar 설정
        bottomBarView.addSubview(buttonStack)
        buttonStack.snp.makeConstraints { make in
            make.leading.equalTo(bookmarkStack.snp.trailing).offset(4)
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
        }
        
        /// buyButton의 고정 너비 설정
        buyButton.snp.makeConstraints { make in
            make.width.equalTo(150) // 원하는 너비로 설정
        }
        /// sellButton의 고정 너비 설정
        sellButton.snp.makeConstraints { make in
            make.width.equalTo(150) // 원하는 너비로 설정
        }
    }
}

// ------------------------------------------------------------------------------------------------------------------------

/// UIView를 통해 커스텀 버튼 만들기
extension UIView {
    static func createCustomButton (
        leftText: String,
        rightText: String,
        subtitleText: String,
        backgroundColor: UIColor) -> UIView {
            let containerView = UIView().then {
                $0.backgroundColor = backgroundColor
                $0.layer.cornerRadius = 10
                $0.layer.masksToBounds = true
                $0.isUserInteractionEnabled = true // 사용자 인터랙션을 활성화
            }
            
            // 왼쪽 레이블 (title)
            let leftLabel = UILabel().then {
                $0.text = leftText
                $0.font = UIFont.boldSystemFont(ofSize: 16)
                $0.textColor = .white
                $0.textAlignment = .left
            }
            
            // 오른쪽 레이블 (price와 subtitle)
            let rightStackView = UIStackView().then {
                $0.axis = .vertical
                $0.alignment = .trailing
                $0.spacing = 2
            }
            
            let rightLabel = UILabel().then {
                $0.text = rightText
                $0.font = UIFont.boldSystemFont(ofSize: 16)
                $0.textColor = .white
                $0.textAlignment = .right
            }
            
            let subtitleLabel = UILabel().then {
                $0.text = subtitleText
                $0.font = UIFont.systemFont(ofSize: 12)
                $0.textColor = UIColor.black.withAlphaComponent(0.8)
                $0.textAlignment = .right
            }
            
            // 오른쪽 레이블을 수직 스택에 추가
            rightStackView.addArrangedSubview(rightLabel)
            rightStackView.addArrangedSubview(subtitleLabel)
            
            // containerView에 서브뷰 추가
            containerView.addSubview(leftLabel)
            containerView.addSubview(rightStackView)
            
            // 제약 조건 설정
            leftLabel.snp.makeConstraints { make in
                make.leading.equalToSuperview().inset(15)
                make.centerY.equalToSuperview()
            }
            
            rightStackView.snp.makeConstraints { make in
                make.trailing.equalToSuperview().inset(15)
                make.centerY.equalToSuperview()
            }
            
            return containerView
        }
}
