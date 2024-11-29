//
//  SearchViewController.swift
//  Kream
//
//  Created by 한금준 on 10/31/24.
//

import UIKit

class SearchViewController: UIViewController {
    private let searchView = SearchView()
    private let searchData = SearchModel.searchDummyData()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view = searchView
        searchView.cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        
        /// 컬렉션 뷰의 데이터 소스와 델리게이트 설정
        setupDelegate()
    }
    
    /// 네비게이션 바를 숨기기
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    ///  컬렉션 뷰의 데이터 바인딩
    private func setupDelegate() {
        searchView.collectionView.dataSource = self
        searchView.collectionView.delegate = self
        
        searchView.searchTextField.delegate = self
    }
    
    /// 모달 방식으로 열린 경우 홈 화면으로 돌아가기 => present 대신 dismiss 이용
    @objc func didTapCancelButton() {
        dismiss(animated: true, completion: nil)
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let searchDetail = SearchDetailViewController()
        /// 모달 방식으로 화면 전환
        searchDetail.modalPresentationStyle = .overCurrentContext  /// 네비게이션 바는 보이도록 설정
        present(searchDetail, animated: true, completion: nil)
        return false
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
        cell.configure(with: searchData[indexPath.item]) /// 셀에 데이터 설정
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 셀에 표시될 텍스트 길이에 따라 너비 설정
        let text = searchData[indexPath.item].suggest
        let font = UIFont.systemFont(ofSize: 16)
        let textWidth = text.size(withAttributes: [.font: font]).width + 20 // 여백 추가
        
        // 한 줄에 3개의 버튼이 들어가도록 최대 너비를 제한
        let maxWidth = (collectionView.frame.width - 40) / 3
        let itemWidth = min(textWidth, maxWidth) /// 텍스트 길이와 최대 너비 중 작은 값 사용

        return CGSize(width: itemWidth, height: 50)
    }
}



