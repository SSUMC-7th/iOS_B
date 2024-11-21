//
//  FirstSearchViewController.swift
//  Week8_Mission
//
//  Created by LEE on 2024/11/22.
//

import UIKit

class FirstSearchViewController: UIViewController {

    let recommendationItemData = dummyRecommendItemModel.recommendItemModelDatas
    let firstSearchView = FirstSearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = firstSearchView
        // navigationItem.backBarButtonItem = nil
        
        firstSearchView.searchLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchLabelTapped)))
        firstSearchView.cancelButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancelButtonTapped)))
        firstSearchView.collectionView.delegate = self
        firstSearchView.collectionView.dataSource = self
        
    }
    
    @objc private func searchLabelTapped(){
        navigationController?.pushViewController(SecondSearchViewController(), animated: true)
    }
    
    @objc private func cancelButtonTapped(){
        navigationController?.popViewController(animated: false)
    }

}

extension FirstSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendationItemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendationItemCell.identifier, for: indexPath) as? RecommendationItemCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(model: recommendationItemData[indexPath.row])
        
        return cell
        
    }
    
}
