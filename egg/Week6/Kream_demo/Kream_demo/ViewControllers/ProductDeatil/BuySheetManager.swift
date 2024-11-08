//
//  BuySheetManager.swift
//  Kream_demo
//
//  Created by 황상환 on 11/7/24.
//

import Foundation
import UIKit

protocol SheetPresentable {
    func presentSheet()
}

class BuySheetManager: SheetPresentable {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func presentSheet() {
        let buySheetVC = BuySheetViewController()
        
        if let sheet = buySheetVC.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true
        }
        
        viewController?.present(buySheetVC, animated: true)
    }
}
