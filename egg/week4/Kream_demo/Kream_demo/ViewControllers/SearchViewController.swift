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

    override func loadView() {
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    private func setupActions() {
        // 취소 버튼을 눌렀을 때 동작 설정
        rootView.cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
    }
    
    @objc private func didTapCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
