//
//  BuyingSheetViewController.swift
//  Kream_demo
//
//  Created by 황상환 on 11/7/24.
//

import Foundation
import UIKit

class BuySheetViewController: UIViewController {
    private let buySheetView = BuySheetView()
    private var selectedSizeButton: UIButton?
    
    override func loadView() {
        view = buySheetView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCloseButton()
        setupSizeButtons()
    }
    
    // 닫기 버튼
    private func setupCloseButton() {
        buySheetView.closeButton.addTarget(
            self,
            action: #selector(closeButtonTapped),
            for: .touchUpInside
        )
    }
    
    // 사이즈 버튼
    private func setupSizeButtons() {
        buySheetView.sizeButtons.forEach {
            $0.addTarget(
                self,
                action: #selector(sizeButtonTapped(_:)),
                for: .touchUpInside
            )
        }
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    // 사이즈 버튼 한개만 택
    @objc private func sizeButtonTapped(_ sender: UIButton) {
        // 이전에 선택된 버튼이 있다면 선택 해제
        selectedSizeButton?.backgroundColor = .white
        selectedSizeButton?.layer.borderColor = UIColor.lightGray.cgColor
        
        // 선택된거 다시 눌렀을 때
        if sender == selectedSizeButton {
            selectedSizeButton = nil
        } else {
            // 새로운 버튼 선택
            sender.backgroundColor = .white
            sender.layer.borderColor = UIColor.black.cgColor
            selectedSizeButton = sender
        }
    }
}
