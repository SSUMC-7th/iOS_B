//
//  HomeView.swift
//  Kream_demo
//
//  Created by 황상환 on 10/10/24.
//

import Foundation
import UIKit
import SnapKit
import Then

class HomeView: UIView {
    // MARK: - Properties
    // 스크롤 뷰
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .white
        $0.bounces = true
        $0.alwaysBounceVertical = true
    }
    
    // 스크롤뷰의 콘텐츠
    private let contentView = UIView().then {
        $0.backgroundColor = .white
    }
    
    // 검색 텍스트 필드
    let searchTextField = UITextField().then {
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.borderStyle = .none
        $0.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        $0.layer.cornerRadius = 10
        $0.font = UIFont.systemFont(ofSize: 13.5)
        $0.clipsToBounds = true
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftView = paddingView
        $0.leftViewMode = .always
    }
    
    // 알림 버튼
    let notificationButton = UIButton().then {
        $0.setImage(UIImage(named: "notification_icon"), for: .normal)
    }
    
    // 상단 메뉴
    let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        $0.selectedSegmentIndex = 0
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
        
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
        
        $0.apportionsSegmentWidthsByContent = true
    }
    
    // 상단 메뉴 언더 바
    let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    // 상단 메뉴 이미지
    let segmentedImageView = UIImageView().then {
        $0.image = UIImage(named: "notRate")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    // 상단 메뉴 빈 뷰
    let emptyView = UIView().then {
        $0.backgroundColor = .white
        $0.isHidden = true
    }
    
    // 상단의 컬렉션 뷰
    let topCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical  // 수직 방향
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.isScrollEnabled = false
        return cv
    }()
    
    // 구분 선
    private let lineView = UIView().then {
        $0.backgroundColor = .systemGray5
    }

    
    // Just Dropped 라벨
    let justDroppedLabel = UILabel().then {
        $0.text = "Just Dropped"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    // 발매상품 라벨
    let justDroppedLabelInfo = UILabel().then {
        $0.text = "발매 상품"
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .gray
    }
    
    // 이미지 컬렉션 뷰
    let bottomCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal  // 가로 스크롤
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    // 구분 선
    private let lineView1 = UIView().then {
        $0.backgroundColor = .systemGray5
    }

    
    // 이미지 컬렉션 뷰 라벨
    let pictureSectionTitleLabel = UILabel().then {
        $0.text = "분위기 한파대비! 연말 필수템 모음"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    // 라벨라벨
    let pictureSectionSubtitleLabel = UILabel().then {
        $0.text = "#해피홀릭챌린지"
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .gray
    }
    
    // 이미지 컬렉션 뷰
    let pictureCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        
        DispatchQueue.main.async {
            self.segmentChanged(self.segmentedControl)
        }
        
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [searchTextField, notificationButton, segmentedControl, underlineView,
         segmentedImageView, emptyView, topCollectionView, lineView, justDroppedLabel,
         justDroppedLabelInfo, bottomCollectionView, lineView1, pictureSectionTitleLabel, pictureSectionSubtitleLabel,
         pictureCollectionView].forEach {      contentView.addSubview($0) }
                
        setupConstraints()
    }
    
    private func setupConstraints() {
        // 스크롤 뷰 설정
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        // 콘텐츠 뷰 설정
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        // 검색바 설정
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(notificationButton.snp.leading).offset(-10)
            $0.height.equalTo(40)
        }
        
        // 알림 버튼 설정
        notificationButton.snp.makeConstraints {
            $0.centerY.equalTo(searchTextField)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.height.equalTo(40)
        }
        
        // 세그먼트 컨트롤 설정
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(40)
        }
        
        // 언더바 설정
        underlineView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(6)
            $0.width.equalTo(UIScreen.main.bounds.width / CGFloat(segmentedControl.numberOfSegments))
            $0.height.equalTo(2)
            $0.leading.equalTo(segmentedControl.snp.leading)
        }
        
        // 세그먼트 이미지뷰 설정
        segmentedImageView.snp.makeConstraints {
            $0.top.equalTo(underlineView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(self.snp.width).multipliedBy(0.9)
        }
        
        // 빈 뷰
        emptyView.snp.makeConstraints {
            $0.edges.equalTo(segmentedImageView)
        }
        
        // 상단 컬렉션 설정
        topCollectionView.snp.makeConstraints {
            $0.top.equalTo(segmentedImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.height.equalTo(200)
        }
        
        // 구분선 설정
        lineView.snp.makeConstraints {
            $0.top.equalTo(topCollectionView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()  // 화면 전체 너비
            $0.height.equalTo(1)  // 높이 1포인트
        }

        // Just Dropped 라벨 설정
        justDroppedLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(16)
        }
        
        // 발매 상품 라벨 설정
        justDroppedLabelInfo.snp.makeConstraints {
            $0.top.equalTo(justDroppedLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(16)
        }
        
        // 하단 컬렉션 뷰 설정
        bottomCollectionView.snp.makeConstraints {
            $0.top.equalTo(justDroppedLabelInfo.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(320)  // bottomCollectionView의 bottom 제약조건 제거
        }
        
        // 구분선 설정
        lineView1.snp.makeConstraints {
            $0.top.equalTo(bottomCollectionView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()  // 화면 전체 너비
            $0.height.equalTo(1)  // 높이 1포인트
        }

        // 이미지섹션 제목 설정
        pictureSectionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(bottomCollectionView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(16)
        }

        // 이미지섹션 부제목 설정
        pictureSectionSubtitleLabel.snp.makeConstraints {
            $0.top.equalTo(pictureSectionTitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
        }

        pictureCollectionView.snp.makeConstraints {
            $0.top.equalTo(pictureSectionSubtitleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(165)
            $0.bottom.equalTo(contentView).offset(-20)  // 마지막 컬렉션뷰만 contentView의 bottom과 연결
        }
    }
    
    // 상단 메뉴 언더바
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let selectedSegmentFrame = sender.subviews[index].frame
        
        UIView.animate(withDuration: 0.3) {
            self.underlineView.snp.updateConstraints {
                let underlineWidth = selectedSegmentFrame.width * 0.8
                $0.width.equalTo(underlineWidth)
                let leadingOffset = selectedSegmentFrame.origin.x + (selectedSegmentFrame.width - underlineWidth) / 2
                $0.leading.equalTo(sender.snp.leading).offset(leadingOffset)
            }
            self.layoutIfNeeded()
        }
        
        if index == 0 {
            segmentedImageView.isHidden = false
            emptyView.isHidden = true
        } else {
            segmentedImageView.isHidden = true
            emptyView.isHidden = false
        }
    }
}
