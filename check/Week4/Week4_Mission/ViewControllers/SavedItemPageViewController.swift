//
//  SavedItemPageViewController.swift
//  Week3_Mission
//
//  Created by LEE on 2024/10/10.
//

import UIKit

class SavedItemPageViewController: UIViewController {

    
    let data = dummySavedItemModel.savedItemDatas
    
    
    private lazy var savedItemPageView: SavedItemPageView = {
        let view = SavedItemPageView()
        view.tableView.dataSource = self
        view.tableView.delegate = self
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedItemPageView
        // Do any additional setup after loading the view.
        print(UserDefaults.standard.string(forKey: "Email"))
        print(UserDefaults.standard.string(forKey: "Password"))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        savedItemPageView.updateCellCount(count: data.count)
        print(UserDefaults.standard.string(forKey: "Email"))
        print(UserDefaults.standard.string(forKey: "Password"))
    }
    

}

extension SavedItemPageViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedItemCell.identifier) as? SavedItemCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
}
