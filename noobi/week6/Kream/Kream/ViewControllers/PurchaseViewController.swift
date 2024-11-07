//
//  PurchaseViewController.swift
//  Kream
//
//  Created by 한금준 on 11/6/24.
//

import UIKit

class PurchaseViewController: UIViewController {
    /// PurchaseView() 초기화
    private let purchaseView = PurchaseView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // PurchaseView를 메인 뷰로 설정
        view = purchaseView
        // closeButton에 액션 추가
        purchaseView.closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
    }
    
    @objc private func didTapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}
