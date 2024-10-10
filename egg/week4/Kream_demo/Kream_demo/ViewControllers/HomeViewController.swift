//
//  HomeViewController.swift
//  Kream_demo
//
//  Created by 황상환 on 10/3/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let rootView = HomeView()
    private let data = HomeModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = rootView
        setupAction()
        setupDelegate()
        registerCell()
    }
    
    private func registerCell() {
        rootView.collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
    private func setupDelegate() {
        rootView.collectionView.dataSource = self
        rootView.collectionView.delegate = self
        rootView.searchTextField.delegate = self
    }
    
    private func setupAction() {
        // ...
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let model = data[indexPath.row]
        cell.imageView.image = model.image
        cell.titleLabel.text = model.title
        
        return cell
    }
    
    // 셀 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalWidth = collectionView.bounds.width
        let padding: CGFloat = 10
        let spacing: CGFloat = 10
        let availableWidth = totalWidth - padding - (spacing * 4)
        let cellWidth = availableWidth / 5  // 5개의 셀 배치
        
        return CGSize(width: cellWidth, height: 100)
    }
    
    // 셀 가로 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    // 셀 세로 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

// 검색창
extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let searchVC = SearchViewController()
        searchVC.modalPresentationStyle = .fullScreen
        present(searchVC, animated: false, completion: nil)
        return false
    }
}
