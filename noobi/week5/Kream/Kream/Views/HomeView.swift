//
//  HomeView.swift
//  Kream
//
//  Created by 한금준 on 10/9/24.
//

import UIKit
import Then
import SnapKit

class HomeView: UIView {
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .fill
        $0.distribution = .fill
    }
    
    let topStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 0
        $0.alignment = .center
        $0.distribution = .fill
    }
    
    let searchTextField = UITextField().then {
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
        $0.font = UIFont.systemFont(ofSize: 13.5)
        $0.textColor = .black
        $0.clipsToBounds = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftView = paddingView
        $0.leftViewMode = .always
    }
    
    let alarmButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let segmentControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        $0.selectedSegmentIndex = 0
        $0.setTitleTextAttributes(
            [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 16, weight: .light)],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 16, weight: .bold)],
            for: .selected
        )
        $0.apportionsSegmentWidthsByContent = true
    }
    
    private let dividedLine = UIView().then {
        $0.backgroundColor = .black
    }
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "광고이미지")
    }
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        
        let numberOfItemsPerRow: CGFloat = 6
        let spacing: CGFloat = 8 // 셀 사이의 간격 설정
        
        let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacing)
        let itemWidth = (UIScreen.main.bounds.width - totalSpacing) / numberOfItemsPerRow
        
        $0.itemSize = CGSize(width: itemWidth, height: itemWidth + 30) // 이미지와 텍스트를 포함한 높이 설정
        $0.minimumInteritemSpacing = spacing
        $0.minimumLineSpacing = spacing
        $0.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }).then{
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
    // Just Dropped 타이틀과 설명 레이블
    let justDroppedTitleLabel = UILabel().then {
        $0.text = "Just Dropped"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .black
    }
    
    let justDroppedSubtitleLabel = UILabel().then {
        $0.text = "발매 상품"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .gray
    }
    
    let justDroppedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then { make in
        make.scrollDirection = .horizontal // 수평 스크롤 설정
        make.minimumLineSpacing = 10
        make.itemSize = CGSize(width: 150, height: 250) // 아이템 크기 설정
    }).then { make in
        make.backgroundColor = .clear
        make.showsHorizontalScrollIndicator = false
        make.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)
    }
    
    // 제목 레이블 생성
    let titleLabel = UILabel().then {
        $0.text = "본격 한파대비! 연말 필수템 모음"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    
    // 해시태그 레이블 생성
    let hashtagLabel = UILabel().then {
        $0.text = "#해피홀리록챌린지"
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    // 수평 스크롤 이미지 컬렉션 뷰 설정
    let challengeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 8
        $0.itemSize = CGSize(width: 150, height: 200) // 원하는 이미지 크기 설정
    }).then{
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.register(ChallengeCollectionViewCell.self, forCellWithReuseIdentifier: ChallengeCollectionViewCell.identifier)
    }
    
    let emptyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textColor = .black
        $0.text = ""
        $0.isHidden = true
    }
    
    private func setupView() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.trailing.bottom.equalTo(contentView).inset(10)
        }
        
        topStackView.addArrangedSubview(searchTextField)
        topStackView.addArrangedSubview(alarmButton)
        
        stackView.addArrangedSubview(topStackView)
        stackView.addArrangedSubview(segmentControl)
        stackView.addArrangedSubview(dividedLine)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(collectionView)
        // Just Dropped 섹션 추가
        stackView.addArrangedSubview(justDroppedTitleLabel)
        stackView.addArrangedSubview(justDroppedSubtitleLabel)
        stackView.addArrangedSubview(justDroppedCollectionView)
        // contentView에 추가
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(hashtagLabel)
        stackView.addArrangedSubview(challengeCollectionView)
        
        stackView.addArrangedSubview(emptyLabel)
        
        searchTextField.snp.makeConstraints {
            $0.height.equalTo(36)
        }
        
        alarmButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        
        segmentControl.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        
        dividedLine.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        imageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
        // 컬렉션 뷰 높이를 두 줄에 맞게 조정
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(200)
        }
        
        // 제약 조건 설정
        justDroppedTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(collectionView.snp.bottom).offset(10)
        }
        
        justDroppedSubtitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(justDroppedTitleLabel.snp.bottom).offset(5)
        }
        
        justDroppedCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(justDroppedSubtitleLabel.snp.bottom).offset(15)
            make.height.equalTo(250) // 컬렉션 뷰 높이 설정
        }
        // 제약 조건 설정
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(justDroppedCollectionView.snp.bottom).offset(10) // 이전 뷰의 아래에 배치
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        hashtagLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(10)
        }
        
        challengeCollectionView.snp.makeConstraints {
            $0.top.equalTo(hashtagLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(200) // 컬렉션 뷰 높이 설정
        }
    }
}
