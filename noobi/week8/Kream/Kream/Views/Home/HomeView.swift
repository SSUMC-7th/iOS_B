//
//  HomeView.swift
//  Kream
//
//  Created by 한금준 on 10/9/24.
//

import UIKit
import Then
import SnapKit

///
class HomeView: UIView {
    
    /// 스크롤 가능한 영역을 제공하는 UIScrollView와 그 내부 콘텐츠 뷰
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupView()
        setupSegmentControlAction() // 세그먼트 컨트롤 액션 설정
        updateDividedLinePosition(animated: false) // 초기 밑줄 위치 설정
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 수직 방향의 스택 뷰로 구성,  각 구성 요소를 세로로 정렬
    let stackView = UIStackView().then { make in
        make.axis = .vertical
        make.spacing = 10
        make.alignment = .fill
        make.distribution = .fill
    }
    
    /// 수평 방향의 상단 스택 뷰, 검색창과 알림 버튼을 포함
    let topStackView = UIStackView().then { make in
        make.axis = .horizontal
        make.spacing = 0
        make.alignment = .center
        make.distribution = .fill
    }
    
    /// 검색창 텍스트 필드
    let searchTextField = UITextField().then { make in
        make.placeholder = "브랜드, 상품, 프로필, 태그 등"
        make.backgroundColor = UIColor(white: 0.95, alpha: 1)
        make.layer.cornerRadius = 10
        make.font = UIFont.systemFont(ofSize: 13.5)
        make.textColor = .black
        make.clipsToBounds = true
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: make.frame.height))
        make.leftView = paddingView
        make.leftViewMode = .always
    }
    /// 알림 버튼
    let alarmButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    
    
    /// 세그먼트 컨트롤, 다양한 카테고리 표시
    let segmentControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0 /// 인덱스 순서대로 표시
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 12, weight: .light)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 12, weight: .bold)
            ],
            for: .selected
        )
        $0.apportionsSegmentWidthsByContent = true
    }
    
    /// 구분선
    private let dividedLine = UIView().then { make in
        make.backgroundColor = .black
    }
    
    let imageView = UIImageView().then { make in
        make.contentMode = .scaleAspectFill
        make.image = UIImage(named: "광고이미지")
    }
    
    /// 1/3 부분 컬렉션 뷰
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{ make in
        
        let numberOfItemsPerRow: CGFloat = 6
        let spacing: CGFloat = 8 // 셀 사이의 간격 설정
        
        let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacing)
        let itemWidth = (UIScreen.main.bounds.width - totalSpacing) / numberOfItemsPerRow
        
        make.itemSize = CGSize(width: itemWidth, height: itemWidth + 30) // 이미지와 텍스트를 포함한 높이 설정
        make.minimumInteritemSpacing = spacing
        make.minimumLineSpacing = spacing
        make.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }).then{ layout in
        layout.backgroundColor = .clear
        layout.isScrollEnabled = false
        layout.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    // JustDropped title과  subtitle 레이블
    let justDroppedTitleLabel = UILabel().then { make in
        make.text = "Just Dropped"
        make.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        make.textColor = .black
    }
    
    let justDroppedSubtitleLabel = UILabel().then { make in
        make.text = "발매 상품"
        make.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        make.textColor = .gray
    }
    
    /// JustDropped 컬렉션뷰 설정
    let justDroppedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then { make in
        make.scrollDirection = .horizontal // 수평 스크롤 설정
        make.minimumLineSpacing = 10
        make.itemSize = CGSize(width: 150, height: 250) // 아이템 크기 설정
    }).then { make in
        make.backgroundColor = .clear
        make.showsHorizontalScrollIndicator = false
        make.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
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
    
    // Challenge 컬렉션 뷰 설정
    let challengeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal /// 수평 스크롤
        $0.minimumLineSpacing = 8
        $0.itemSize = CGSize(width: 150, height: 200) // 원하는 이미지 크기 설정
    }).then{
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.register(ChallengeCollectionViewCell.self, forCellWithReuseIdentifier: ChallengeCollectionViewCell.identifier)
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    let emptyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textColor = .black
        $0.text = ""
        $0.isHidden = true
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    private func setupView() {
        
        // 스크롤 뷰 설정
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // 콘텐츠 뷰 설정
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
        }
        
        // 스택 뷰 설정
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.trailing.bottom.equalTo(contentView).inset(10)
        }
        
        // ------------------------------------------------------------------------------------------------------------------------
        
        // 상단 스택 뷰에 검색창과 알림 버튼 추가
        topStackView.addArrangedSubview(searchTextField)
        topStackView.addArrangedSubview(alarmButton)
        
        // 스택 뷰에 구성 요소 추가
        stackView.addArrangedSubview(topStackView)
        stackView.addArrangedSubview(segmentControl)
        stackView.addArrangedSubview(dividedLine)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(collectionView)
        // ------------------------------------------------------------------------------------------------------------------------
        // JustDropped label과 view 추가
        stackView.addArrangedSubview(justDroppedTitleLabel)
        stackView.addArrangedSubview(justDroppedSubtitleLabel)
        stackView.addArrangedSubview(justDroppedCollectionView)
        // Challenge lable과 view 추가
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(hashtagLabel)
        stackView.addArrangedSubview(challengeCollectionView)
        // ------------------------------------------------------------------------------------------------------------------------
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
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(200)
        }
        // ------------------------------------------------------------------------------------------------------------------------
        /// 제약 조건 설정
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
            make.height.equalTo(250)
        }
        // ------------------------------------------------------------------------------------------------------------------------
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(justDroppedCollectionView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        hashtagLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(10)
        }
        
        challengeCollectionView.snp.makeConstraints {
            $0.top.equalTo(hashtagLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(200)
        }
        // ------------------------------------------------------------------------------------------------------------------------
    }
    /// 각 세그먼트를 눌렀을 때 아래 밑줄이 움직이도록 구현
    private func setupSegmentControlAction() {
        segmentControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
    }
    
    /// segment 인덱스에 따라 collectionView 표시
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        updateDividedLinePosition(animated: true)
    }
    
    private func updateDividedLinePosition(animated: Bool) {
        let selectedIndex = segmentControl.selectedSegmentIndex
        let segmentWidth = segmentControl.frame.width / CGFloat(segmentControl.numberOfSegments)
        let newXPosition = segmentWidth * CGFloat(selectedIndex)
        
        dividedLine.snp.remakeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom).offset(2)
            $0.left.equalTo(segmentControl.snp.left).offset(newXPosition)
            $0.width.equalTo(segmentWidth)
            $0.height.equalTo(1)
        }
        
        if animated {
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            }
        } else {
            self.layoutIfNeeded()
        }
    }
}


