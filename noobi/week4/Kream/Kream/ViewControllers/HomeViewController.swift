//
//  HomeViewController.swift
//  Kream
//
//  Created by 한금준 on 10/2/24.
//

import UIKit

class HomeViewController: UIViewController {
    /// HomeView() 초기화
    private let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        
        setupAction()
        setupDelegate()
    }
    
    /// segmentControl의 값이 변경될 때 호출될 액션을 설정
    private func setupAction() {
        homeView.segmentControl.addTarget(
            self,
            action: #selector(segmentControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    ///  컬렉션 뷰의 데이터 바인딩
    private func setupDelegate() {
        homeView.collectionView.dataSource = self
    }
    
    /// 세그먼트 컨트롤에 의해 선택된 인덱스에 따라 표시 변경
    @objc
    private func segmentControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.imageView.isHidden = false
            homeView.collectionView.isHidden = false
            homeView.emptyLabel.isHidden = true
        }
        else {
            homeView.imageView.isHidden = true
            homeView.collectionView.isHidden = true
            homeView.emptyLabel.isHidden = false
        }
    }
}

/// UICollectionViewDataSource 프로토콜을 구현하여 컬렉션 뷰의 데이터 소스 설정
extension HomeViewController: UICollectionViewDataSource {
    /// CollectionView에 몇개의 데이터가 들어갈지를 Int 타입의 변수로 반환하기 위해 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeModel.dummy().count
    }
    /// 셀 선언 후 데이터 바인딩 및 바인딩된 셀을 반환
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// guard let 을 이용해 옵셔널 바인딩
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeCollectionViewCell.identifier,
            for: indexPath
        ) as? HomeCollectionViewCell else {
            return UICollectionViewCell() /// cell의 값이 nil인 경우 UICollectionViewCell()을 반환
        }
        let list = HomeModel.dummy()
        
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
        
        return cell
    }
}
