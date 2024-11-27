//
//  SearchViewController.swift
//  Kream_demo
//
//  Created by 황상환 on 10/11/24.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    private let rootView = SearchView()
    private let data = ["채원 슈프림 후리스", "나이키V2K런", "뉴발란드996", "신상 나이키 콜라보", "허그 FW 패딩", "벨루어 늡시"]

    override func loadView() {
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        setupCollectionView()
        setupNavigationBar()
        
        // 검색창 이동
        setupDelegate()
    }
    
    // 검색창이동
    private func setupDelegate() {
        rootView.searchTextField.delegate = self
    }
    
//    private func setupActions() {
//        // 취소 버튼을 눌렀을 때 동작 설정
//        rootView.cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
//    }
//    
//    @objc private func didTapCancelButton() {
//        self.dismiss(animated: true, completion: nil)
//    }
    
    // -> 취소 버튼 클로저로 수정
    private func setupActions() {
        rootView.cancelButton.addAction(UIAction { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }, for: .touchUpInside)
    }
    
    // 네비게이션 바 숨기기
    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // Collection 뷰
    private func setupCollectionView() {
        rootView.recommendCollectionView.delegate = self
        rootView.recommendCollectionView.dataSource = self
        rootView.recommendCollectionView.register(RecommendCollectionViewCell.self,
                                                forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
    }
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 항목 수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    // 각 셀 내용
    func collectionView(_ collectionView: UICollectionView,
                       cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RecommendCollectionViewCell.identifier,
            for: indexPath) as? RecommendCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.titleLabel.text = data[indexPath.item]
        return cell
    }
    
    // 각 셀 크기
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = data[indexPath.item]
        let font = UIFont.systemFont(ofSize: 12)
        let label = UILabel()
        label.font = font
        label.text = text
        let width = label.intrinsicContentSize.width + 32  // 패딩 조정
        return CGSize(width: width, height: 34)
    }
    
    // 셀 간 가로 간격
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       minimumInteritemSpacing: CGFloat) -> CGFloat {
        return 0
    }
    
    // 셀 간 세로 간격
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       minimumLineSpacing: CGFloat) -> CGFloat {
        return 0
    }
    
}

// SearchDeatilView로 이동
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let searchDetailVC = SearchDetailViewController()
        navigationController?.pushViewController(searchDetailVC, animated: true)
        return false
    }
}
