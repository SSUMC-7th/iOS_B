//
//  UserViewController.swift
//  MoyaTest
//
//  Created by 황상환 on 11/19/24.
//

import UIKit
import Moya
import SnapKit
import Then

class UserViewController: UIViewController {
    
    private let provider = MoyaProvider<UserTargetType>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        getUserInfo()
        postFile()
    }
    
    private func getUserInfo() {
        provider.request(.getAllUsers) { result in
            switch result {
            case .success(let response):
                do {
                    let userResponse = try response.map([UserResponseModel].self)
                  print("Successfully mapped response: \(userResponse)")
                } catch {
                  print("Mapping error: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Network request error: \(error.localizedDescription)")
            }
        }
    }
    
    private func postFile() {
        guard let image = Image(named: "Sun_duck")?.pngData() else {
            fatalError("Error: Invalid image!")
        }
        
        provider.request(.postFile(Image: image)) { result in
            switch result {
                case .success(let response):
                    do {
                        let fileResponse = try response.map(FileResponseModel.self)
                        print("Successfully mapped response: \(fileResponse)")
                    } catch {
                        print("Mapping error: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    print("Network request error: \(error.localizedDescription)")
                }
            }
    }
}
