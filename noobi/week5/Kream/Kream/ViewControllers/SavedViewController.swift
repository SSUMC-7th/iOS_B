//
//  SavedViewController.swift
//  Kream
//
//  Created by 한금준 on 10/6/24.
//

import UIKit

class SavedViewController: UIViewController {
    let data = SavedModel.savedDummyData()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
        savedView.updateSubtitle(with: data.count)  // 데이터 개수에 맞춰 subtitle 업데이트
    }
    
    private lazy var savedView: SavedView = {
        let view = SavedView()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else { return UITableViewCell()
        }
        
        cell.configure(with: data[indexPath.row])
        return cell
    }
}
