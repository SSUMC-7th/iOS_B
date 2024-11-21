//
//  SecondSearchViewController.swift
//  Week8_Mission
//
//  Created by LEE on 2024/11/22.
//

import UIKit
import Moya

class SecondSearchViewController: UIViewController {

    private let secondSearchView = SecondSearchView()
    private var resultItems : [SearchItemModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        secondSearchView.cancelButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancelButtonTapped)))
        secondSearchView.searchTextField.delegate = self
        
        secondSearchView.tableView.delegate = self
        secondSearchView.tableView.dataSource = self
        
        view = secondSearchView
        
    }
    

    @objc private func cancelButtonTapped(){
        print("gd")
        navigationController?.popToRootViewController(animated: true)
    }

    private func trySearch(with text: String){
        let provider = MoyaProvider<SearchTargetType>()
        provider.request(.searchItems(keyword: text)){
            (result) in
            
            switch result{
            case .success(let response) :
                do{
                    print(response)
                    let searchResponse = try response.map(SearchResponseModel.self)
                    self.resultItems = searchResponse.products
                    
                    self.secondSearchView.tableView.reloadData()
                    
                }catch{
                    print("검색 결과 파싱 에러")
                }
            case .failure(let _) :
                print("검색 에러 발생")
            }
        }
    }
}

extension SecondSearchViewController: UITextFieldDelegate{
    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let keyword = textField.text else { return false }
        if keyword.count == 0 { return false }
        
        trySearch(with: keyword)
        
        return true
    }
}

extension SecondSearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchItemCell.identifier, for: indexPath) as? SearchItemCell else { 
            return UITableViewCell()
        }
        
        cell.configure(with: resultItems[indexPath.row].title)
        print(resultItems.count)

        return cell
    }
    
    
}
