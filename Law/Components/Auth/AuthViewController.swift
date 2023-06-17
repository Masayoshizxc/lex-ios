//
//  AuthViewController.swift
//  Law
//
//  Created by Adilet on 15/6/23.
//

import UIKit
import SnapKit

class AuthViewController: BaseViewController {

    var coordinator: MainCoordinator?
    
    private lazy var viewBackground: CAGradientLayer = {
        let gr = CAGradientLayer()
        gr.type = .axial
        gr.colors = [
            UIColor(red: 173/255, green: 204/255, blue: 250/255, alpha: 1).cgColor,
            UIColor(red: 57/255, green: 131/255, blue: 191/255, alpha: 1).cgColor
        ]
        gr.locations = [0.0, 0.7]
        gr.frame = self.view.bounds
        return gr
    }()
    
    
    private lazy var logView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 40
        
        return v
    }()
    private lazy var timeImage: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "time")
        return i
    }()
    private lazy var bagImage: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "bag")
        
        return i
    }()
    private lazy var gearImage: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "6")
        return i
    }()
    
    private lazy var logTitle: UILabel = {
        let l = UILabel()
        l.text = "Log in"
        l.font = .boldSystemFont(ofSize: 30)
        l.textColor = UIColor(red: 57/255, green: 130/255, blue: 191/255, alpha: 1)
        return l
    }()
    private lazy var emailField: BlueTextField = {
        let t = BlueTextField()
        t.attributedPlaceholder = NSAttributedString(string: "\tEmail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        return t
    }()
    private lazy var passwordField: BlueTextField = {
        let t = BlueTextField()
        t.attributedPlaceholder = NSAttributedString(string: "\tPassword", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        return t
    }()
    private lazy var logBtn: UIButton = {
        let b = UIButton()
        b.setTitle("Log in", for: .normal)
        b.titleLabel?.font = .boldSystemFont(ofSize: 15)
        b.setTitleColor(UIColor(red: 57/255, green: 130/255, blue: 191/255, alpha: 1), for: .normal)
        b.backgroundColor = .white
        b.layer.cornerRadius = 20
        b.addTarget(self, action: #selector(logTap), for: .touchUpInside)
        return b
    }()
    private lazy var regBtn: UIButton = {
        let b = UIButton()
        b.backgroundColor = .none
        b.setTitle("You don’t have an account? Click here", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = .systemFont(ofSize: 15)
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.insertSublayer(viewBackground, at: 0)
        setupSubviews()
        setupConstraints()
//        for family in UIFont.familyNames {
//            print("\(family)")
//
//            for name in UIFont.fontNames(forFamilyName: family) {
//                print("   \(name)")
//            }
//        }
    }
    @objc func logTap() {
        getUser()
//        createUser()
    }
    
    func createUser() {
        var url = URL(string: "http://127.0.0.1:8080/users")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters = ["name": "Qwe","login": "qwe","password": "3018160107031111"]
        request.httpMethod = "POST"
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters,options: .prettyPrinted) else { return }
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) {(data,response,error) in
            if let response = response {
                print(response)
            }
            guard let data = data else { return }
            do {
                print(data)
                
            }catch{
                print(error)
            }
            
        }.resume()
    }
    
    func getUser() {
        guard let url = URL(string: "http://127.0.0.1:8080/users") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters = ["name":"asd"]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters,options: .prettyPrinted) else { return }
//        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) {(data,response,error) in
            if let response = response {
                print(response)
            }
            guard let data = data else { return }
            do {
                print(data)
                
            }catch{
                print(error)
            }
            
        }.resume()
        
        
    }


}

extension AuthViewController {
    
    func setupSubviews() {
        view.addSubview(timeImage)
        view.addSubview(bagImage)
        view.addSubview(gearImage)
        view.addSubview(logView)
        logView.addSubview(logTitle)
        logView.addSubview(emailField)
        logView.addSubview(passwordField)
        view.addSubview(logBtn)
        view.addSubview(regBtn)
    }
    
    func setupConstraints() {
        logView.snp.makeConstraints{make in
            make.left.right.equalToSuperview().inset(45)
            make.top.equalToSuperview().inset(331)
            make.bottom.equalToSuperview().inset(263)
            
        }
        timeImage.snp.makeConstraints{make in
            make.width.height.equalTo(200)
            make.left.equalToSuperview()
            make.top.equalToSuperview().inset(61)
        }
        
        bagImage.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(216)
            make.left.equalToSuperview().inset(208)
            make.width.height.equalTo(200)
        }
        gearImage.snp.makeConstraints{make in
            make.width.height.equalTo(200)
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().inset(126)
        }
        logTitle.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(32)
            make.left.equalToSuperview().inset(26)
        }
        emailField.snp.makeConstraints{make in
            make.left.right.equalToSuperview().inset(26)
            make.top.equalToSuperview().inset(85)
            make.height.equalTo(40)
        }
        passwordField.snp.makeConstraints{make in
            make.left.right.equalToSuperview().inset(26)
            make.top.equalTo(emailField.snp.bottom).offset(27)
            make.height.equalTo(40)
        }
        logBtn.snp.makeConstraints{make in
            make.left.right.equalToSuperview().inset(120)
            make.height.equalTo(50)
            make.top.equalTo(logView.snp.bottom).offset(37)
        }
        regBtn.snp.makeConstraints{make in
            make.left.right.equalToSuperview().inset(61)
            make.bottom.equalToSuperview().inset(68)
        }
    }
}

