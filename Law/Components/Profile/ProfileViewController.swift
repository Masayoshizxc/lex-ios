//
//  ProfileViewController.swift
//  Law
//
//  Created by Adilet on 18/6/23.
//

import UIKit
import SnapKit

class ProfileViewController: BaseViewController {
    var coordinator: ProfileCoordinator?
    
    private lazy var settingsBtn: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "settings"), for: .normal)
        b.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        
        return b
    }()
    private lazy var editBtn: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "edit"), for: .normal)
        b.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        
        return b
    }()
    private lazy var avatar: UIImageView = {
        let v = UIImageView()
        v.layer.cornerRadius = 60
        v.image = UIImage(named: "Avatar")
        return v
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }
    
}

extension ProfileViewController {
    
    func setupSubviews() {
        view.addSubview(settingsBtn)
        view.addSubview(editBtn)
        view.addSubview(avatar)
    }
    func setupConstraints() {
        settingsBtn.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(47)
            make.left.equalToSuperview().inset(28)
        }
        
        editBtn.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(47)
            make.right.equalToSuperview().inset(25)
        }
        avatar.snp.makeConstraints{make in
            make.width.height.equalTo(120)
            make.top.equalToSuperview().inset(47)
            make.centerX.equalToSuperview()
        }
    }
}
