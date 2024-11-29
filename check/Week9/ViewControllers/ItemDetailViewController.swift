//
//  ItemDetailViewController.swift
//  Week6_Mission
//
//  Created by LEE on 2024/11/07.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    
    let data = dummyDetailItemModel.dummyDetailItemModelDatas
    
    lazy var itemDetailView : ItemDetailView = {
        
        let view = ItemDetailView()
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = itemDetailView
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .done, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        itemDetailView.buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped(){
        
    }
    
    @objc func buyButtonTapped(){
        let buyItemVC = BuyItemViewController()
        buyItemVC.modalPresentationStyle = .automatic
        self.present(BuyItemViewController(), animated: true)
    }
    
}


extension ItemDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DifferentColorCell.identifier, for: indexPath) as? DifferentColorCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
    }
    
    
}
