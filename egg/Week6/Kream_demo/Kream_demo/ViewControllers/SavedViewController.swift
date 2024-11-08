//
//  SavedViewController.swift
//  Kream_demo
//
//  Created by 황상환 on 10/3/24.
//

import UIKit

class SavedViewController: UIViewController {
    
    let data = dummySavedModels.savedDatas

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedImageView
    }
    
    private lazy var savedImageView: SavedImageView = {
        let view = SavedImageView()
        view.tableView.dataSource = self
        view.tableView.delegate = self
        return view
    }()
}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedItemsCell.identifier, for: indexPath) as? SavedItemsCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
}
