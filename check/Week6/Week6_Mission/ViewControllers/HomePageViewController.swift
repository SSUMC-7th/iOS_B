//
//  HomePageViewController.swift
//  Week4_Mission
//
//  Created by LEE on 2024/10/11.
//

import UIKit

class HomePageViewController: UIViewController {
    
    let data = dummyCategoryModel.CategoryModelDatas
    let itemData = dummyItemModel.ItemModelDatas
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
    
    @objc func segmentControlTapped(_ segment: UISegmentedControl){
        
        
        if segment.selectedSegmentIndex == 0{
            homePageView.collectionView.isHidden = false
            homePageView.adImageView.isHidden = false
        }else{
            homePageView.collectionView.isHidden = true
            homePageView.adImageView.isHidden = true
        }
    }
    
    @objc func searchLabelTapped(){
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        vc.modalPresentationStyle = .automatic
        self.present(vc, animated: true)
    }
}


extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return data.count
        }else if collectionView.tag == 1{
            print(itemData.count)
            return itemData.count
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
        }else if collectionView.tag == 1{ // 아이템 컬렉션 뷰
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath) as? ItemCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(model: itemData[indexPath.row])
            
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
