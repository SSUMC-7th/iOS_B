//
//  HomePageViewController.swift
//  Week4_Mission
//
//  Created by LEE on 2024/10/11.
//

import UIKit

class HomePageViewController: UIViewController {
    
    let data = dummyCategoryModel.CategoryModelDatas
    let justDroppedItemData = dummyJustDroppedItemModel.ItemModelDatas
    let winterItemData = dummyWinterItemModel.WinterItemModelDatas
    
    private lazy var homePageView : HomePageView = {
        let view = HomePageView()
        
        view.collectionView.dataSource = self
        view.collectionView.delegate = self
        
        view.segmentControl.addTarget(self, action: #selector(segmentControlTapped(_:)), for: .valueChanged)
        
        view.itemCollectionView.delegate = self
        view.itemCollectionView.dataSource = self
        
        view.winterItemCollectionView.delegate = self
        view.winterItemCollectionView.dataSource = self
        
        view.searchLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchLabelTapped)))
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.addSubview(homePageView)
        scrollView.contentSize = CGSize(width : homePageView.bounds.width, height: 1400)
        
        homePageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 1400)
        view = scrollView
        
        
        // Do any additional setup after loading the view.
    }
    
    
    // 세그먼트 컨트롤 터치 시
    @objc func segmentControlTapped(_ segment: UISegmentedControl){
        
        
        if segment.selectedSegmentIndex == 0{
            homePageView.collectionView.isHidden = false
            homePageView.adImageView.isHidden = false
        }else{
            homePageView.collectionView.isHidden = true
            homePageView.adImageView.isHidden = true
        }
    }
    
    // 서치 바 터치 시
    @objc func searchLabelTapped(){
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        vc.modalPresentationStyle = .automatic
        self.navigationController?.pushViewController(FirstSearchViewController(), animated: false)
    }
}


extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return data.count
        }else if collectionView.tag == 1{
            print(justDroppedItemData.count)
            return justDroppedItemData.count
        }else{
            print(winterItemData.count)
            return winterItemData.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0{ // 카테고리 컬렉션 뷰
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(model: data[indexPath.row])
            
            return cell
        }else if collectionView.tag == 1{ // 발매 상품 아이템 컬렉션 뷰
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JustDroppedItemCell.identifier, for: indexPath) as? JustDroppedItemCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(model: justDroppedItemData[indexPath.row])
            
            return cell
            
        }else{  // 겨울 아이템 컬렉션 뷰
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WinterItemCell.identifier, for: indexPath) as? WinterItemCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(model: winterItemData[indexPath.row])
            
            return cell
        }
        
        
    }
    
}

