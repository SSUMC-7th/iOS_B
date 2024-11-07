//
//  ProductDetailViewController.swift
//  Kream
//
//  Created by 한금준 on 11/4/24.
//

import UIKit

class ProductDetailViewController: UIViewController {
    var product: ProductDetailModel? 
    /// ProductDetailView 초기화
    private let productDetail = ProductDetailView()
    
    private let data = ProductDetailModel.clothesDummyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // 네비게이션 바의 뒤로가기 버튼
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(didTapBackButton))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        
        view = productDetail
        // buyButton 탭 제스처 추가
        let buyTapGesture = UITapGestureRecognizer(target: self, action: #selector(buyButtonDidTap))
        productDetail.buyButton.addGestureRecognizer(buyTapGesture)
        
        setupDelegate()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    ///  컬렉션 뷰의 데이터 바인딩
    private func setupDelegate() {
        productDetail.productDetailCollectionView.dataSource = self
        productDetail.productDetailCollectionView.delegate = self
    }
    
    // 뒤로가기 버튼 동작
    @objc func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    /// 모달 방식을 통한 view 생성
    @objc func buyButtonDidTap() {
        let purchaseViewController = PurchaseViewController()
        
        purchaseViewController.view.backgroundColor = .white
        purchaseViewController.modalPresentationStyle = .formSheet
        
        present(purchaseViewController, animated: true, completion: nil)
    }
}

extension ProductDetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    /// /// 각 컬렉션 뷰의 항목 개수를 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    /// 컬렉션 뷰 셀을 구성하고 반환
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// guard let 을 이용해 옵셔널 바인딩, Product 컬렉션 뷰 셀 설정
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProductDetailCollectionViewCell.identifier,
            for: indexPath
        ) as? ProductDetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        let list = data
        cell.imageView.image = list[indexPath.item].clothesImage
        return cell
    }
}
