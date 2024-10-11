//
//  HomePageView.swift
//  Week4_Mission
//
//  Created by LEE on 2024/10/11.
//

import UIKit
import Then

class HomePageView: UIView {

    private let headerView = UIView().then{
        $0.backgroundColor = .white
    }
    
    private let alarmImageView = UIImageView(image: UIImage(systemName: "bell")).then{
        $0.backgroundColor = .white
        $0.tintColor = .black
    }
    
    let searchLabel = UILabel().then{
        $0.text = "   브랜드, 상품, 프로필, 태그 등"
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 14, weight: .light)
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
    }
    
    let segmentControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then{
        $0.apportionsSegmentWidthsByContent = true
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        $0.setTitleTextAttributes([.foregroundColor : UIColor.black, .font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)
        
        $0.setTitleTextAttributes([.foregroundColor : UIColor.black, .font: UIFont.systemFont(ofSize: 16, weight: .light)], for: .normal)
        
        $0.selectedSegmentIndex = 0
        
        
    }
    
    
    let adImageView = UIImageView().then{
        $0.image = UIImage(named:"image_ad_none.png")
    }
    
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.itemSize = .init(width: 60, height: 80)
        $0.minimumInteritemSpacing = 10
        $0.minimumLineSpacing = 20
        
    }).then{
        $0.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        $0.backgroundColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setContstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    private func setViews(){
        self.addSubview(headerView)
        self.headerView.addSubview(alarmImageView)
        self.headerView.addSubview(searchLabel)
        self.headerView.addSubview(segmentControl)
        self.addSubview(adImageView)
        self.addSubview(collectionView)
    }
    
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
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    

}
