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
    
    private let data = HomeModel.homeDummyData()
    
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
        homeView.collectionView.delegate = self
        homeView.justDroppedCollectionView.dataSource = self
        homeView.justDroppedCollectionView.delegate = self
        homeView.challengeCollectionView.dataSource = self
        homeView.challengeCollectionView.delegate = self
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
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    /// CollectionView에 몇개의 데이터가 들어갈지를 Int 타입의 변수로 반환하기 위해 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        return data.count
        
        if collectionView == homeView.collectionView {
            return HomeModel.homeDummyData().count // 메인 컬렉션 뷰의 데이터 수
        } else if collectionView == homeView.justDroppedCollectionView {
            return HomeModel.productDummyData().count // Just Dropped 컬렉션 뷰의 데이터 수
        } else if collectionView == homeView.challengeCollectionView {
            return HomeModel.challengeDummyData().count // User Photos 컬렉션 뷰의 데이터 수
        }
        return 0
    }
    /// 셀 선언 후 데이터 바인딩 및 바인딩된 셀을 반환
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// guard let 을 이용해 옵셔널 바인딩
        if collectionView == homeView.collectionView {
            /// 메인 컬렉션 뷰 셀 설정
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeCollectionViewCell.identifier,
                for: indexPath
            ) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            let list = HomeModel.homeDummyData()
            cell.imageView.image = list[indexPath.row].savedImage
            cell.titleLabel.text = list[indexPath.row].name
            return cell
        } else if collectionView == homeView.justDroppedCollectionView {
            /// Just Dropped 컬렉션 뷰 셀 설정
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: JustDroppedCollectionViewCell.identifier,
                for: indexPath
            ) as? JustDroppedCollectionViewCell else {
                return UICollectionViewCell()
            }
            let list = HomeModel.productDummyData()
            cell.productImageView.image = list[indexPath.row].savedImage
            cell.nameLabel.text = list[indexPath.row].name
            cell.brandLabel.text = list[indexPath.row].brand
            cell.priceLabel.text = list[indexPath.row].price
            cell.transactionVolumeLabel.text = list[indexPath.row].transactionVolume
            cell.descriptionLabel.text = list[indexPath.row].describe
            
            // 두 번째 셀의 북마크만 채워진 아이콘으로 설정
            if indexPath.row == 1 {
                cell.bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            } else {
                cell.bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
            }
            return cell
        } else if collectionView == homeView.challengeCollectionView {
            /// User Photos 컬렉션 뷰 셀 설정
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ChallengeCollectionViewCell.identifier,
                for: indexPath
            ) as? ChallengeCollectionViewCell else {
                return UICollectionViewCell()
            }
            let list = HomeModel.challengeDummyData()
            cell.imageView.image = list[indexPath.row].savedImage
            cell.nameLabel.text = list[indexPath.row].name
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let search = SearchViewController()
        search.modalPresentationStyle = .fullScreen
        present(search, animated: false, completion: nil)
        return false
    }
}
