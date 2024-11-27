//
//  ViewController.swift
//  Kingfisher_test
//
//  Created by 황상환 on 11/27/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gestureView
    }
    
    private lazy var gestureView: GestureImageView = {
        let view = GestureImageView()
        view.loadImage(from: "https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525041814981qduu.jpg")
        return view
    }()

}

#Preview {
    ViewController()
}
