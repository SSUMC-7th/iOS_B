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
    
    // UI 요소
    // 검색창
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
    
    // segmented 메뉴
    let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        $0.selectedSegmentIndex = 0
        
        // Divider와 배경 이미지 제거
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
        
        // 선택되지 않은 상태의 텍스트 속성
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        
        // 선택된 상태의 텍스트 속성
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
        $0.apportionsSegmentWidthsByContent = true
    }
    
    // 밑줄..
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    // 추천 메뉴 사진
    let segmentedImageView = UIImageView().then {
        $0.image = UIImage(named: "notRate")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    // 빈 화면을 위한 emptyView 추가
    let emptyView = UIView().then {
        $0.backgroundColor = .white
        $0.isHidden = true
    }
    
    // UICollectionView 추가
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 100, height: 150)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    
    // 초기화 메서드
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        
        // 기본 선택된 세그먼트의 밑줄을 설정 (index 0)
        DispatchQueue.main.async {
            self.segmentChanged(self.segmentedControl)
        }
        
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // UI 요소 추가 및 레이아웃
    private func setupView() {
        addSubview(searchTextField)
        addSubview(notificationButton)
        addSubview(segmentedControl)
        addSubview(underlineView)
        addSubview(segmentedImageView)
        addSubview(emptyView)
        addSubview(collectionView)
        
        // 레이아웃 설정
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(notificationButton.snp.leading).offset(-10)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
        }
        
        notificationButton.snp.makeConstraints {
            $0.centerY.equalTo(searchTextField)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.height.equalTo(40)
        }
        
        // segmented 메뉴바
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(40)
        }
        
        // 밑줄
        let segmentWidth = UIScreen.main.bounds.width / CGFloat(segmentedControl.numberOfSegments)
        underlineView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(6)
            $0.width.equalTo(segmentWidth)
            $0.height.equalTo(2)
            $0.leading.equalTo(segmentedControl.snp.leading)
        }
        
        // 추천 이미지 뷰
        segmentedImageView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(self.snp.width).multipliedBy(0.9)
        }
        
        // 빈 화면
        emptyView.snp.makeConstraints {
            $0.edges.equalTo(segmentedImageView)
        }
        
        // 콜렉션 뷰
        collectionView.snp.makeConstraints {
            $0.top.equalTo(segmentedImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(250)
        }
    }

    // 밑줄 커스텀
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let selectedSegmentFrame = sender.subviews[index].frame

        // 밑줄 숨기기
        underlineView.isHidden = true
        
        UIView.animate(withDuration: 0.3, animations: {
            self.underlineView.snp.updateConstraints {
                // 세그먼트 width의 60%
                let underlineWidth = selectedSegmentFrame.width * 0.6
                $0.width.equalTo(underlineWidth)
                
                // 가운데 정렬 -> (세그먼트 전체 너비 - 밑줄 너비) / 2
                let leadingOffset = selectedSegmentFrame.origin.x + (selectedSegmentFrame.width - underlineWidth) / 2
                $0.leading.equalTo(sender.snp.leading).offset(leadingOffset)
            }
            self.layoutIfNeeded()
        }) { _ in
            // 애니메이션 완료 후 밑줄 보이기
            self.underlineView.isHidden = false
        }

        // 추천(인덱스 0)일 때는 segmentedImageView를 보여주고, 나머지일 때는 emptyView를 보여줌
        if index == 0 {
            segmentedImageView.isHidden = false
            emptyView.isHidden = true
        } else {
            segmentedImageView.isHidden = true
            emptyView.isHidden = false
        }
    }
}
