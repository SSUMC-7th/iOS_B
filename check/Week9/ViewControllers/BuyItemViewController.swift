//
//  BuyItemViewController.swift
//  Week6_Mission
//
//  Created by LEE on 2024/11/07.
//

import UIKit

class BuyItemViewController: UIViewController {

    
    
    lazy var buyItemView = BuyItemView()
    
    var selectedSizeButton : SizeButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = buyItemView
        
        buyItemView.sSizeButton.addTarget(self, action: #selector(sizeButtonTapped(_ :)), for: .touchUpInside)
        buyItemView.mSizeButton.addTarget(self, action: #selector(sizeButtonTapped(_ :)), for: .touchUpInside)
        buyItemView.lSizeButton.addTarget(self, action: #selector(sizeButtonTapped(_ :)), for: .touchUpInside)
        buyItemView.xlSizeButton.addTarget(self, action: #selector(sizeButtonTapped(_ :)), for: .touchUpInside)
        buyItemView.xxlSizeButton.addTarget(self, action: #selector(sizeButtonTapped(_ :)), for: .touchUpInside)

    }
    
    @objc func sizeButtonTapped(_ sender: SizeButton){
        
        selectedSizeButton?.layer.borderWidth = 0.2
        
        sender.layer.borderWidth = 1.0
        
        selectedSizeButton = sender
        
    }
    


}
