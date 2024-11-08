//
//  ProductDetailInfoViewController.swift
//  Kream_demo
//
//  Created by 황상환 on 11/7/24.
//

import Foundation
import UIKit

//class ProductDetailInfoViewController: UIViewController {
//    
//    private let rootView = ProductDetailInfoView()
//    private let data = ProductDetailInfoModel.dummy()
//    
//    // MARK: - Lifecycle
//    override func loadView() {
//        view = rootView
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupDelegate()
//        setupNavigation() // 뒤로가기를 위한 네비게이션
//        setupActions() // 시트
//    }
//    
//    private func setupDelegate() {
//        rootView.imageCollection.dataSource = self
//        rootView.imageCollection.delegate = self
//    }
//    
//    private func setupActions() {
//        rootView.buyButton.addTarget(
//            self,
//            action: #selector(buyButtonTapped),
//            for: .touchUpInside
//        )
//    }
//    
//    @objc private func buyButtonTapped() {
//        let buySheetVC = BuySheetViewController()
//        
//        if let sheet = buySheetVC.sheetPresentationController {
//            sheet.detents = [.large()]
//            sheet.prefersGrabberVisible = true
//        }
//        
//        present(buySheetVC, animated: true)
//    }
//}
//
//// MARK: - CollectionView
//extension ProductDetailInfoViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return data.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(
//            withReuseIdentifier: ProductImageCell.identifier,
//            for: indexPath
//        ) as? ProductImageCell else {
//            return UICollectionViewCell()
//        }
//        
//        let model = data[indexPath.item]
//        cell.configure(with: model.image)
//        return cell
//    }
//    
//    private func setupNavigation() {
//        // 커스텀 백 버튼 생성
//        let backButton = UIBarButtonItem(
//            image: UIImage(systemName: "arrow.backward"),
//            style: .plain,
//            target: self,
//            action: #selector(backButtonTapped)
//        )
//        navigationItem.leftBarButtonItem = backButton
//        
//        // 네비게이션 바 설정
//        navigationController?.navigationBar.tintColor = .black
//        navigationController?.navigationBar.backgroundColor = .clear
//    }
//    
//    @objc private func backButtonTapped() {
//        // HomeViewController로 이동
//        let homeVC = HomeViewController()
//        navigationController?.setViewControllers([homeVC], animated: true)
//    }
//    
//}

class ProductDetailInfoViewController: UIViewController {
    private let rootView = ProductDetailInfoView()
    private let data = ProductDetailInfoModel.dummy()
    
    private lazy var navigationManager = ProductDetailNavigationManager(viewController: self)
    private lazy var collectionManager = ProductImageCollectionManager(data: data)
    private lazy var sheetManager = BuySheetManager(viewController: self)
    
    // MARK: - Lifecycle
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupCollectionView()
        navigationManager.configureNavigation()
        setupActions()
    }
    
    private func setupCollectionView() {
        rootView.imageCollection.dataSource = collectionManager
        rootView.imageCollection.delegate = collectionManager
    }
    
    private func setupActions() {
        rootView.buyButton.addTarget(
            self,
            action: #selector(buyButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc private func buyButtonTapped() {
        sheetManager.presentSheet()
    }
}
