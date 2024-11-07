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
    // ------------------------------------------------------------------------------------------------------------------------
    ///  컬렉션 뷰의 데이터 바인딩
    private func setupDelegate() {
        homeView.collectionView.dataSource = self
        homeView.collectionView.delegate = self
        homeView.justDroppedCollectionView.dataSource = self
        homeView.justDroppedCollectionView.delegate = self
        homeView.challengeCollectionView.dataSource = self
        homeView.challengeCollectionView.delegate = self
        
        homeView.searchTextField.delegate = self
    }
    
    // ------------------------------------------------------------------------------------------------------------------------
    
    /// 세그먼트 컨트롤에 의해 선택된 인덱스에 따라 표시 변경
    @objc
    private func segmentControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.imageView.isHidden = false
            homeView.collectionView.isHidden = false
            homeView.justDroppedTitleLabel.isHidden = false
            homeView.justDroppedSubtitleLabel.isHidden = false
            homeView.justDroppedCollectionView.isHidden = false
            homeView.titleLabel.isHidden = false
            homeView.hashtagLabel.isHidden = false
            homeView.challengeCollectionView.isHidden = false
            homeView.emptyLabel.isHidden = true
        }
        else {
            homeView.imageView.isHidden = true
            homeView.collectionView.isHidden = true
            homeView.justDroppedTitleLabel.isHidden = true
            homeView.justDroppedSubtitleLabel.isHidden = true
            homeView.justDroppedCollectionView.isHidden = true
            homeView.titleLabel.isHidden = true
            homeView.hashtagLabel.isHidden = true
            homeView.challengeCollectionView.isHidden = true
            homeView.emptyLabel.isHidden = false
        }
    }

    
    
}

/// UICollectionViewDataSource 프로토콜을 구현하여 컬렉션 뷰의 데이터 소스 설정
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    /// /// 각 컬렉션 뷰의 항목 개수를 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.collectionView {
            return HomeModel.homeDummyData().count // Home 컬렉션 뷰의 데이터 수
        } else if collectionView == homeView.justDroppedCollectionView {
            return HomeModel.productDummyData().count // Just Dropped 컬렉션 뷰의 데이터 수
        } else if collectionView == homeView.challengeCollectionView {
            return HomeModel.challengeDummyData().count // Challenge 컬렉션 뷰의 데이터 수
        }
        return 0
    }
    /// 컬렉션 뷰 셀을 구성하고 반환
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// guard let 을 이용해 옵셔널 바인딩
        if collectionView == homeView.collectionView {
            /// home 컬렉션 뷰 셀 설정
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeCollectionViewCell.identifier,
                for: indexPath
            ) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            let list = HomeModel.homeDummyData()
            cell.imageView.image = list[indexPath.item].savedImage
            cell.titleLabel.text = list[indexPath.item].name
            return cell
    // ------------------------------------------------------------------------------------------------------------------------
        } else if collectionView == homeView.justDroppedCollectionView {
            /// Just Dropped 컬렉션 뷰 셀 설정
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: JustDroppedCollectionViewCell.identifier,
                for: indexPath
            ) as? JustDroppedCollectionViewCell else {
                return UICollectionViewCell()
            }
            let list = HomeModel.productDummyData()
            cell.productImageView.image = list[indexPath.item].savedImage
            cell.nameLabel.text = list[indexPath.item].name
            cell.brandLabel.text = list[indexPath.item].brand
            cell.priceLabel.text = list[indexPath.item].price
            cell.transactionVolumeLabel.text = list[indexPath.item].transactionVolume
            cell.descriptionLabel.text = list[indexPath.item].describe
            
            // 두 번째 셀의 북마크만 채워진 아이콘으로 설정
            if indexPath.item == 1 {
                cell.bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            } else {
                cell.bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
            }
            return cell
    // ------------------------------------------------------------------------------------------------------------------------
        } else if collectionView == homeView.challengeCollectionView {
            /// Challenge 컬렉션 뷰 셀 설정
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ChallengeCollectionViewCell.identifier,
                for: indexPath
            ) as? ChallengeCollectionViewCell else {
                return UICollectionViewCell()
            }
            let list = HomeModel.challengeDummyData()
            cell.imageView.image = list[indexPath.item].savedImage
            cell.nameLabel.text = list[indexPath.item].name
            return cell
        }
    // ------------------------------------------------------------------------------------------------------------------------
        return UICollectionViewCell()
    }
}
// UITextFieldDelegate 프로토콜을 구현하여 텍스트 필드 액션을 설정
extension HomeViewController: UITextFieldDelegate {
    /// 검색창을 탭할 때 호출되는 메서드
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let search = SearchViewController()
        search.modalPresentationStyle = .fullScreen
        present(search, animated: false, completion: nil)
        return false
    }
}

// ------------------------------------------------------------------------------------------------------------------------

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Just Dropped 컬렉션 뷰에서 선택된 경우에만 상세 화면으로 이동
        if collectionView == homeView.justDroppedCollectionView {
            let selectedProduct = ProductDetailModel.clothesDummyData()[indexPath.item]
            
            // DetailViewController 생성 및 선택된 상품 데이터 전달
            let detailVC = ProductDetailViewController()
            detailVC.product = selectedProduct // 선택된 상품 데이터 전달
            
            // 네비게이션 스택으로 푸시
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
// ------------------------------------------------------------------------------------------------------------------------
}

/// UITableView 사용 시 section / row
/// UICollectionView 사용 시 section / item을 써주는 것이 바람직하다고 한다. 기능적으로는 크게 차이가 없다고 함.

