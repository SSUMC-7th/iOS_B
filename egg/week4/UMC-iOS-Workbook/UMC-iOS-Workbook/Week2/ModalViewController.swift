//
//  ModalViewController.swift
//  UMC-iOS-Workbook
//
//  Created by 황상환 on 10/2/24.
//

import UIKit
import SnapKit

class ModalViewController: UIViewController {

    private let lable = UILabel()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lable.text = "버튼을 누르면 모달 방식의 화면 전환이 일어나요"
        lable.textColor = .blue
        
        button.setTitle("버튼을 눌러주세요", for: .normal)
        button.backgroundColor = .systemIndigo
        
        view.addSubview(lable)
        view.addSubview(button)
        
        lable.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(55)
            $0.width.equalTo(255)
        }
        
        // 액션 처리를 하려면 addTarget 필요
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        
    }
    
    // 버튼이 눌렸을 때 실행되는 액션 메서드는 꼭 @objc 키워드를 넣어야함.
    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .brown
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
    }

}
