//
//  HomePageView.swift
//  Week4_Mission
//
//  Created by LEE on 2024/10/11.
//

import UIKit
import Then

class HomePageView: UIView {

    // MARK: - UIComponents
    
    // 헤더 뷰
    // 검색 레이블, 알람 이미지, 세그먼트 컨트롤을 포함
    let headerView = UIView().then{
        $0.backgroundColor = .white
    }
    
    // 알람 이미지 뷰
    let alarmImageView = UIImageView(image: UIImage(systemName: "bell")).then{
        $0.backgroundColor = .white
        $0.tintColor = .black
    }
    
    // 검색 레이블
    let searchLabel = UILabel().then{
        $0.text = "   브랜드, 상품, 프로필, 태그 등"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 14, weight: .light)
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
    }
    
    // 세그먼트 컨트롤
    let segmentControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then{
        $0.apportionsSegmentWidthsByContent = true
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        $0.setTitleTextAttributes([.foregroundColor : UIColor.black, .font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)
        
        $0.setTitleTextAttributes([.foregroundColor : UIColor.black, .font: UIFont.systemFont(ofSize: 16, weight: .light)], for: .normal)
        
        $0.selectedSegmentIndex = 0
        
        
    }
    
    // 광고 이미지 뷰
    let adImageView = UIImageView().then{
        $0.image = UIImage(named:"image_ad_none.png")
    }
    
    // 상품 카테고리 뷰
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.itemSize = .init(width: 60, height: 80)
        $0.minimumInteritemSpacing = 10
        $0.minimumLineSpacing = 20
        
    }).then{
        $0.tag = 0
        $0.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        $0.backgroundColor = .white
    }
    
    
    let itemTitleLabel = UILabel().then{
        $0.text = "Just Dropped"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    let itemSubLabel = UILabel().then{
        $0.text = "발매 상품"
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 16, weight: .thin)
    }
    
    // 아이템 컬렉션 뷰
    let itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.itemSize = .init(width: 140, height: 280)
        $0.minimumInteritemSpacing = 10
        $0.scrollDirection = .horizontal
    
        
    }).then{
        $0.tag = 1
        $0.register(JustDroppedItemCell.self, forCellWithReuseIdentifier: JustDroppedItemCell.identifier)
        $0.backgroundColor = .white
    }
    
    let winterItemTitleLabel = UILabel().then{
        $0.text = "본격 한파대비! 연말 필수템 모음"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    let winterItemSubLabel = UILabel().then{
        $0.text = "#해피홀리룩챌린지"
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 16, weight: .thin)
    }
    
    let winterItemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.itemSize = .init(width: 110, height: 160)

        $0.minimumLineSpacing = 20
        $0.scrollDirection = .horizontal
    
    }).then{
        $0.tag = 2
        $0.register(WinterItemCell.self, forCellWithReuseIdentifier: WinterItemCell.identifier)
        $0.backgroundColor = .white
    }
    
    // MARK: - 이니셜라이저
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setContstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    // MARK: - setViews 메소드
    private func setViews(){

        self.addSubview(headerView)
        self.headerView.addSubview(alarmImageView)
        self.headerView.addSubview(searchLabel)
        self.headerView.addSubview(segmentControl)
        self.addSubview(adImageView)
        self.addSubview(collectionView)
        

        self.addSubview(itemTitleLabel)
        self.addSubview(itemSubLabel)
        self.addSubview(itemCollectionView)
        
        self.addSubview(winterItemTitleLabel)
        self.addSubview(winterItemSubLabel)
        self.addSubview(winterItemCollectionView)
        
    }
    
    // MARK: - setConstraints 메소드
    private func setContstraints(){
        

        headerView.snp.makeConstraints{(make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.height.equalTo(90)
        }
        
        alarmImageView.snp.makeConstraints{(make) in
            make.centerY.equalTo(searchLabel)
            make.right.equalToSuperview().inset(14)
            make.width.height.equalTo(24)
        }
        
        searchLabel.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().inset(14)
            make.right.equalTo(alarmImageView.snp.left).offset(-14)
            make.height.equalTo(40)
        }
        
        segmentControl.snp.makeConstraints{(make) in
            make.left.right.equalToSuperview().inset(14)
            make.top.equalTo(searchLabel.snp.bottom).offset(10)
            make.height.equalTo(30)
        }
        
        adImageView.snp.makeConstraints{(make) in
            make.top.equalTo(headerView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(336)
        }
        
        collectionView.snp.makeConstraints{(make) in
            make.top.equalTo(adImageView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(14)
            make.height.equalTo(180)
        }
        
        itemTitleLabel.snp.makeConstraints{(make) in
            make.bottom.equalTo(collectionView.snp.bottom).offset(70)
            make.left.right.equalToSuperview().inset(14)
        }
        
        itemSubLabel.snp.makeConstraints{(make) in
            make.top.equalTo(itemTitleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(14)
        }
        
        itemCollectionView.snp.makeConstraints{(make) in
            make.top.equalTo(itemSubLabel.snp.bottom).offset(10)
            make.height.equalTo(280)
            make.left.right.equalToSuperview().inset(14)
            
        }
        
        winterItemTitleLabel.snp.makeConstraints{(make) in
            make.bottom.equalTo(itemCollectionView.snp.bottom).offset(70)
            make.left.right.equalToSuperview().inset(14)
        }
        
        winterItemSubLabel.snp.makeConstraints{(make) in
            make.top.equalTo(winterItemTitleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(14)
        }
        
        winterItemCollectionView.snp.makeConstraints{(make) in
            make.top.equalTo(winterItemSubLabel.snp.bottom).offset(10)
            make.height.equalTo(200)
            make.left.right.equalToSuperview().inset(14)
        }
    }
}
