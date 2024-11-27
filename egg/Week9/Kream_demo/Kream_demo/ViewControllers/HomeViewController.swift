//
//  HomeViewController.swift
//  Kream_demo
//
//  Created by 황상환 on 10/3/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // HomeView와 더미 데이터
    private let rootView = HomeView()
    private let data = HomeModel.dummy()
    private let productData = ProductModel.dummy()
    private let pictureData = PictureModel.dummy()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = rootView
        setupAction()
        setupDelegate()
        registerCell()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func registerCell() {
        // Top Collection View Cell 등록
        rootView.topCollectionView.register(
            HomeCollectionViewCell.self,
            forCellWithReuseIdentifier: HomeCollectionViewCell.identifier
        )
        
        // Bottom Collection View Cell 등록
        rootView.bottomCollectionView.register(
            ProductCollectionViewCell.self,
           forCellWithReuseIdentifier: ProductCollectionViewCell.identifier
       )
    
        // Pricture Collection View Cell 등록
        rootView.pictureCollectionView.register(
            PictureCollectionViewCell.self,
            forCellWithReuseIdentifier: PictureCollectionViewCell.identifier
        )
    }
    
    private func setupDelegate() {
        // Top Collection View
        rootView.topCollectionView.dataSource = self
        rootView.topCollectionView.delegate = self
        
        // Bottom Collection View
        rootView.bottomCollectionView.dataSource = self
        rootView.bottomCollectionView.delegate = self
        
        // TextField
        rootView.searchTextField.delegate = self
        
        // Picture Collection View
        rootView.pictureCollectionView.dataSource = self
        rootView.pictureCollectionView.delegate = self
    }
    
    private func setupAction() {
        // Action 설정...
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 컬렉션 뷰의 아이템 개수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView === rootView.topCollectionView {
            return data.count  // 원형 아이템 데이터
        } else if collectionView === rootView.pictureCollectionView {
            return pictureData.count  // 사진 데이터
        } else {
            return productData.count  // Just Dropped 데이터
        }
    }

    // 각 컬렉션 뷰 셀의 내용을 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView === rootView.topCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeCollectionViewCell.identifier,
                for: indexPath
            ) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let model = data[indexPath.row]
            cell.imageView.image = model.image
            cell.titleLabel.text = model.title
            return cell
            
        } else if collectionView === rootView.pictureCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PictureCollectionViewCell.identifier,
                for: indexPath
            ) as? PictureCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let model = pictureData[indexPath.row]
            cell.configure(with: model)
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductCollectionViewCell.identifier,
                for: indexPath
            ) as? ProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            // configure 방식 수정
            let model = productData[indexPath.row]
            cell.configure(with: model)
            return cell
        }
    }
    
    // 각 컬렉션 뷰 셀의 크기 설정
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView === rootView.pictureCollectionView {
            return CGSize(width: 124, height: 165)
        } else if collectionView === rootView.topCollectionView {
            let totalWidth = collectionView.bounds.width
            let spacing: CGFloat = 20
            let numberOfItems: CGFloat = 5
            let itemWidth = (totalWidth - (spacing * (numberOfItems - 1))) / numberOfItems
            return CGSize(width: itemWidth, height: 80)
        } else {
            // Just Dropped 아이템 크기
            let width = (collectionView.bounds.width - 32) / 2.2
            return CGSize(width: width, height: 270)
        }
    }
    
    
    // 컬렉션 뷰의 아이템 간격 설정
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView === rootView.topCollectionView ? 10 : 10
    }
    
    // 컬렉션 뷰의 라인 간격 설정
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView === rootView.topCollectionView ? 20 : 12
    }
    
    // 컬렉션 뷰 설정
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView === rootView.topCollectionView {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        } else {
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }
    }
}

// 검색창
extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let searchVC = SearchViewController()
//        searchVC.modalPresentationStyle = .fullScreen
//        present(searchVC, animated: false, completion: nil)
        navigationController?.pushViewController(searchVC, animated: true)
        return false
    }
}
