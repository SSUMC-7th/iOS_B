//
//  ProfileView.swift
//  Week2_Mission
//
//  Created by LEE on 2024/10/04.
//

import UIKit
import SnapKit

class MyPageView: UIView {

    // MARK: - UIComponents
    lazy var settingButton : UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .black
        return button
        
    }()
    
    lazy var cameraButton : UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var profileImage : UIImageView = {
        
        let image = UIImageView(image: UIImage(systemName: "person.crop.circle"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .black

        return image
    }()
    
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Jeong_iOS"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var followerLabel : UILabel = {
        let label = UILabel()
        label.text = "팔로워 328"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy var followingLabel : UILabel = {
        let label = UILabel()
        label.text = "팔로잉 20"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy var editButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("프로필 관리", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.2
        return button
    }()
    
    lazy var shareButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("프로필 공유", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)

        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.2
        return button
    }()
    
    lazy var dividingView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: - 이니셜라이저
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    
    required init?(coder: NSCoder){
        fatalError("NSCoder Error")
    }
    
    private func addComponents(){
        self.addSubview(settingButton)
        self.addSubview(cameraButton)
        self.addSubview(profileImage)
        self.addSubview(nameLabel)
        self.addSubview(followerLabel)
        self.addSubview(followingLabel)
        self.addSubview(editButton)
        self.addSubview(shareButton)
        self.addSubview(dividingView)
        
        settingButton.snp.makeConstraints{(make) in
            make.left.equalToSuperview().inset(32.5)
            make.top.equalToSuperview().inset(72.5)
            make.width.height.equalTo(25)
        }
        
        settingButton.imageView?.snp.makeConstraints{(make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        cameraButton.snp.makeConstraints{(make) in
            make.right.equalToSuperview().inset(32.5)
            make.top.equalToSuperview().inset(72.5)
            make.width.height.equalTo(25)
        }
        
        cameraButton.imageView?.snp.makeConstraints{(make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        profileImage.snp.makeConstraints{(make) in
            make.left.equalToSuperview().inset(32.5)
            make.top.equalTo(settingButton.snp.bottom).offset(26)
            make.width.height.equalTo(90)
        }
        
        nameLabel.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(147)
            make.width.equalTo(115)
            make.height.equalTo(23)
        }
        
        followerLabel.snp.makeConstraints{(make) in
            make.left.equalTo(nameLabel.snp.left)
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.width.equalTo(60)
            make.height.equalTo(17)
        }
        
        followingLabel.snp.makeConstraints{(make) in
            make.left.equalTo(followerLabel.snp.right).offset(8)
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.width.equalTo(60)
            make.height.equalTo(17)
        }
        
        editButton.snp.makeConstraints{(make) in
            make.left.equalTo(settingButton.snp.left)
            make.top.equalTo(profileImage.snp.bottom).offset(26)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
        
        shareButton.snp.makeConstraints{(make) in
            make.right.equalTo(cameraButton.snp.right)
            make.top.equalTo(profileImage.snp.bottom).offset(26)
            make.width.equalTo(157)

            make.height.equalTo(26)
        }
        
        dividingView.snp.makeConstraints{(make) in
            make.height.equalTo(25)
            make.left.right.equalToSuperview()
            make.top.equalTo(editButton.snp.bottom).offset(30)
        }
        
    }
    
}
