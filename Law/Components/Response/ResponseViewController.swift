//
//  ResponseViewController.swift
//  Law
//
//  Created by Adilet on 18/6/23.
//

import UIKit
import SnapKit

class ResponseViewController: BaseViewController {
    var coordinator: ResponseCoordinator?
    
    private lazy var settingsBtn: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "settings"), for: .normal)
        b.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        
        return b
    }()
    private lazy var notifBtn: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "notifications"), for: .normal)
        b.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        
        return b
    }()
    private lazy var mainView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 20
        
        return v
    }()
    private lazy var responseView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 20
        v.backgroundColor = .white
        return v
    }()
    private lazy var titleView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 20
        v.backgroundColor = .white
        return v
    }()
    private lazy var labelTitle: UILabel = {
        let l = UILabel()
        l.text = "Ответы"
        l.font = .boldSystemFont(ofSize: 20)
        l.textColor = .lightGray
        return l
    }()
    private lazy var emptyLabel: UILabel = {
        let l = UILabel()
        l.text = "Пока что нет новых ответов..."
        l.textColor = .lightGray
        
        return l
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }
    
}


extension ResponseViewController {
    
    func setupSubviews(){
        view.addSubview(settingsBtn)
        view.addSubview(notifBtn)
        view.addSubview(mainView)
        mainView.addSubview(titleView)
        mainView.addSubview(responseView)
        titleView.addSubview(labelTitle)
        responseView.addSubview(emptyLabel)
    }
    
    func setupConstraints(){
        settingsBtn.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(47)
            make.left.equalToSuperview().inset(28)
        }
        
        notifBtn.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(47)
            make.right.equalToSuperview().inset(25)
        }
        mainView.snp.makeConstraints{make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(120)
            make.height.equalTo(570)
        }
        titleView.snp.makeConstraints{make in
            make.left.top.right.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
        responseView.snp.makeConstraints{make in
            make.left.right.bottom.equalToSuperview().inset(30)
            make.height.equalTo(420)
        }
        labelTitle.snp.makeConstraints{make in
            make.centerX.centerY.equalToSuperview()
        }
        emptyLabel.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(11)
        }
    }
    
}
