//
//  HomePageViewController.swift
//  Week4_Mission
//
//  Created by LEE on 2024/10/11.
//

import UIKit

class HomePageViewController: UIViewController {
    
    let data = dummyCategoryModel.CategoryModelDatas
    
    private lazy var homePageView : HomePageView = {
        let view = HomePageView()
        view.collectionView.dataSource = self
        view.collectionView.delegate = self
        view.segmentControl.addTarget(self, action: #selector(segmentControlTapped(_:)), for: .valueChanged)
        
        view.searchLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchLabelTapped)))
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homePageView
        print("개수 : \(data.count)")
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
        print("ddddd")
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        vc.modalPresentationStyle = .automatic
        self.present(vc, animated: true)
    }
}


extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    
    
}
