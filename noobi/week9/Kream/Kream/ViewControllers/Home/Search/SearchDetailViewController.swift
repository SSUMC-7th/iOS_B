//
//  SearchDetailViewController.swift
//  Kream
//
//  Created by 한금준 on 11/19/24.
//

import UIKit
import Moya

class SearchDetailViewController: UIViewController, UITextFieldDelegate {
    
    /// 네트워크 요청을 수행할 Provider 객체를 선언
    private let provider = MoyaProvider<UserSearchType>()
    
    var tableView = UITableView()
    /// 서버에서 받아온 원본 검색 결과 데이터를 저장.
    /// 사용자가 검색어를 지우거나 수정할 때, 다시 원본 데이터에서 필터링해야 하므로
    var searchResults: [Product] = []
    /// 사용자가 텍스트 필드에 입력한 검색어에 따라 필터링된 데이터 저장.
    /// 필터링된 데이터가 실시간으로 테이블 뷰에 반영되도록 하기 위해 별도로 저장
    var filteredProducts: [Product] = []  // 필터된 검색어 목록을 저장할 배열
    
    let searchDetailView = SearchDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view = searchDetailView
        
        searchDetailView.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        
        let backButtonItem = UIBarButtonItem(customView: searchDetailView.backButton)
        navigationItem.leftBarButtonItem = backButtonItem
        
        searchDetailView.cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        
        searchDetailView.searchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        // UITextField의 Delegate 설정
        searchDetailView.searchTextField.delegate = self
        
        tableSetUp()
        
        // 테이블 뷰 설정
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProductCell")
    }
    
    private func tableSetUp() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchDetailView.searchTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
    
    /// 뒤로가기 버튼 동작
    @objc func didTapBackButton() {
        /// 현재 화면을 모달 방식으로 닫고 이전 화면으로 돌아가기 => present 아닌 dismiss 이용
        dismiss(animated: true, completion: nil)
    }
    
    /// 취소 버튼 동작
    /// presentingViewController -> 현재 뷰 컨트롤러가 다른 뷰 컨트롤러에 의해 프레젠트되었다면, 그 부모 뷰 컨트롤러가 반환됨.
    @objc func didTapCancelButton() {
        /// 모달 방식으로 열린 화면을 닫고 홈 화면으로 돌아가기
        if let rootViewController = self.presentingViewController?.presentingViewController {
            rootViewController.dismiss(animated: true, completion: nil)
        }
    }
    
    /// 정보 불러오기
    private func getSearchInfo(query: String) {
        provider.request(.search(query: query)) { result in
            switch result {
            case .success(let response):
                do {
                    let json = try JSONSerialization.jsonObject(with: response.data, options: []) /// reponse가 잘 되는지 확인용
                    print("Response JSON: \(json)")
                    
                    let searchResponse = try JSONDecoder().decode(UserSearchModel.self, from: response.data)
                    print("Successfully mapped response: \(searchResponse.products)")
                    
                    /// 검색된 제품을 searchResults 배열에 저장
                    self.searchResults = searchResponse.products
                    /// 테이블 뷰 리로드
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
                    self.tableView.reloadData()
                } catch let decodingError {
                    print("Mapping error: \(decodingError.localizedDescription)")
                }
                
            case .failure(let error):
                print("Network request error: \(error.localizedDescription)")
            }
        }
    }
    
    /// UITextField에서 텍스트가 변경될 때마다 호출
    @objc func textFieldDidChange() {
        guard let query = searchDetailView.searchTextField.text, !query.isEmpty else {
            /// 텍스트가 비어있으면 필터링된 제품 목록을 초기화하고 테이블 뷰를 리로드
            filteredProducts = []
            tableView.reloadData()
            return
        }
        
        /// 필터링된 제품 목록을 업데이트
        filteredProducts = searchResults.filter { $0.title.lowercased().contains(query.lowercased()) }
        tableView.reloadData()  // 테이블 뷰 리로드
    }
    
    // Return 버튼 클릭 시 서버 통신
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let query = textField.text, !query.isEmpty else {
            // 텍스트가 비어있으면 서버 통신을 하지 않음
            return true
        }
        
        // 서버 통신 함수 호출
        getSearchInfo(query: query)
        
//        textField.resignFirstResponder()  // 키보드 숨기기
        return true
    }
}

extension SearchDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    /// 테이블 뷰 섹션 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// 테이블 뷰의 행 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    /// 각 셀에 데이터 넣기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        let product = searchResults[indexPath.row]
        cell.textLabel?.text = product.title /// title을 표시
        return cell
    }
}




