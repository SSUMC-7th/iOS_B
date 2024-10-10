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
    
    /// 검색바 생성
    let searchBar: UISearchBar = {
        let textField = UISearchBar()
        textField.placeholder = "브랜드, 상품, 프로필, 태그 등"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(white: 0.95, alpha: 1)
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    /// 알람버튼 생성
    let alarmButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "bell"), for: .normal)
            button.tintColor = .black
            return button
        }()
    
    /// 상단 컴포넌트 표시
    let segmentControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0 /// 인덱스 순서대로 표시
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
    
    /// 각 segment 눌렀을 때 아래 밑줄이 생기도록 우선 line 생성
    private let dividedLine = UIView().then{
        $0.backgroundColor = .black
    }
    
    /// 광고 이미지 첨부
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill // 이미지 비율을 유지하며 맞추기
        $0.image = UIImage(named: "광고이미지") // 여기에 사용할 이미지 이름을 입력하세요
    }
    
    /// 10개의 컬렉션 뷰를 생성 -> UICollectionViewFlowLayout의 속성 선언
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        
        let numberOfItemsPerRow: CGFloat = 5
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
       
    /// 다른 컴포넌트를 클릭했을 때 빈 화면이 보이도록 구현
    let emptyLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textColor = .black
        $0.text = ""
        $0.isHidden = true
    }
    
    /// 각각의 제약 조건
    private func setupView(){
        [
            searchBar,
            alarmButton,
            segmentControl,
            collectionView,
            dividedLine,
            imageView,
            emptyLabel
        ].forEach{
            addSubview($0)
        }
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalTo(alarmButton.snp.left).offset(-10)
            $0.height.equalTo(36)
        }
        
        alarmButton.snp.makeConstraints {
            $0.centerY.equalTo(searchBar)
            $0.right.equalToSuperview().offset(-20)
            $0.width.height.equalTo(24)
        }
        
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().offset(-20)
            $0.height.equalTo(20)
        }
        
        dividedLine.snp.makeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom).offset(2)
            $0.left.equalToSuperview()
            $0.width.equalTo(0)
            $0.height.equalTo(1)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(dividedLine.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        emptyLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
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
