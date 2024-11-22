//
//  SearchDetailViewController.swift
//  Kream_demo
//
//  Created by 황상환 on 11/20/24.
//

import Foundation
import UIKit
import SnapKit
import Then
import Moya

class SearchDetailViewController: UIViewController {
    private let rootView = SearchDetailView()
    private let provider = MoyaProvider<SearchService>()
    private var products: [ProductResponseModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = rootView
        setupActions()
        setupDelegates()
    }
    
    // 뒤로가기 버튼 Actions
    private func setupActions() {
        rootView.cancelArrowButton.addAction(UIAction { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }, for: .touchUpInside)
        
        rootView.cancelButton.addAction(UIAction { [weak self] _ in
            self?.navigationController?.popToRootViewController(animated: true)
        }, for: .touchUpInside)
    }
    
    private func setupDelegates() {
        // 검색창에 변화 감지
        rootView.searchTextField.delegate = self
        
        // 검색 결과 감지
        rootView.resultSearchView.delegate = self
        rootView.resultSearchView.dataSource = self
    }
    
    // 검색 결과 받아오기
    private func enterSearch(with query: String) {
        provider.request(.search(query: query)) { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let searchResponse = try response.map(SearchResponse.self)
                    self?.products = searchResponse.products
                    
                    // UI 업데이트
                    DispatchQueue.main.async {
                        self?.rootView.resultSearchView.reloadData()
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            case .failure(let error):
                print("Network error: \(error)")
            }
        }
    }
}

// MARK: - Delegate

// 검색창 delegate
extension SearchDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let query = textField.text, !query.isEmpty {
            enterSearch(with: query)
        }
        
        return true
    }
}

// 검색 결과 탭뷰 delegate
extension SearchDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.title // title 보여줘!
        return cell
    }
}
