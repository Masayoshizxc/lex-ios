//
//  HomeViewController.swift
//  Law
//
//  Created by Adilet on 18/6/23.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {
    
    var coordinator: HomeCoordinator?
    
    var lawyers = [Lawyer]()
    
    private lazy var filterBtn: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "filter"), for: .normal)
        b.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        
        return b
    }()
    private lazy var notifBtn: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "notifications"), for: .normal)
        b.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        
        return b
    }()
    private lazy var searchField: UITextField = {
        let t = UITextField()
        t.attributedPlaceholder = NSAttributedString(string: "Поиск...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        t.textAlignment = .center
        t.leftViewMode = UITextField.ViewMode.always
        t.leftViewMode = .always
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        img.image = UIImage(named: "search")
        
        t.leftView = img
        t.layer.cornerRadius = 17
        t.layer.borderWidth = 1
        t.layer.borderColor = UIColor.lightGray.cgColor
        return t
    }()
    private lazy var mainView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 30
        return v
    }()
    private lazy var recentView: UIButton = {
        let v = UIButton()
        v.setImage(UIImage(named: "recent"), for: .normal)
        v.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
        v.layer.cornerRadius = 15
        return v
    }()
    private lazy var lawyersView: UIButton = {
        let v = UIButton()
        v.setImage(UIImage(named: "lawyers"), for: .normal)
        v.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
        v.layer.cornerRadius = 15
        v.addTarget(self, action: #selector(lawyersTapped), for: .touchUpInside)
        return v
    }()
    private lazy var e1: UIButton = {
        let v = UIButton()
        v.layer.cornerRadius = 15
        v.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
        v.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        return v
    }()
    private lazy var e2: UIButton = {
        let v = UIButton()
        v.layer.cornerRadius = 15
        v.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
        v.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        return v
    }()
    private lazy var e3: UIButton = {
        let v = UIButton()
        v.layer.cornerRadius = 15
        v.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
        v.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        return v
    }()
    private lazy var e4: UIButton = {
        let v = UIButton()
        v.layer.cornerRadius = 15
        v.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
        v.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        return v
    }()
    private lazy var recLabel: UILabel = {
        let l = UILabel()
        l.text = "Недавние"
        l.font = .systemFont(ofSize: 15)
        return l
    }()
    private lazy var lawLabel: UILabel = {
        let l = UILabel()
        l.text = "Юристы"
        l.font = .systemFont(ofSize: 15)
        return l
    }()
    private lazy var tableView: UITableView = {
        let t = UITableView()
        t.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        t.delegate = self
        t.dataSource = self
        t.separatorStyle = .none
        t.backgroundColor = .lightGray
        t.showsVerticalScrollIndicator = false
        
        return t
    }()
    private lazy var tView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 30
        return v
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setLawyers(cell: Lawyer.fetch())
        setupSubviews()
        setupConstraints()
    }
    
    @objc func lawyersTapped() {
        recentView.removeFromSuperview()
        lawyersView.removeFromSuperview()
        e1.removeFromSuperview()
        e2.removeFromSuperview()
        e3.removeFromSuperview()
        e4.removeFromSuperview()
        recLabel.removeFromSuperview()
        lawLabel.removeFromSuperview()
        mainView.addSubview(tableView)
        tableView.snp.makeConstraints{make in
            make.top.left.right.bottom.equalToSuperview().inset(15)
        }
        let res = UILabel()
        res.text = "Результаты:"
        res.font = .boldSystemFont(ofSize: 20)
        res.textColor = .lightGray
        view.addSubview(res)
        res.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(90)
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }
    }
    
}

extension HomeViewController {
    
    func setupSubviews() {
        view.addSubview(filterBtn)
        view.addSubview(searchField)
        view.addSubview(notifBtn)
        view.addSubview(mainView)
        mainView.addSubview(recentView)
        mainView.addSubview(lawyersView)
        mainView.addSubview(e1)
        mainView.addSubview(e2)
        mainView.addSubview(e3)
        mainView.addSubview(e4)
        mainView.addSubview(recLabel)
        mainView.addSubview(lawLabel)
    }
    
    func setupConstraints() {
        filterBtn.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(47)
            make.left.equalToSuperview().inset(28)
        }
        searchField.snp.makeConstraints{make in
            make.width.equalTo(229)
            make.height.equalTo(35)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(47)
            
        }
        notifBtn.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(47)
            make.right.equalToSuperview().inset(25)
        }
        mainView.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(120)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(570)
        }
        recentView.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(22)
            make.left.equalToSuperview().inset(17)
        }
        lawyersView.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(22)
            make.right.equalToSuperview().inset(17)
        }
        e1.snp.makeConstraints{make in
            make.top.equalTo(recentView.snp.bottom).offset(35)
            make.left.equalToSuperview().inset(17)
            make.width.height.equalTo(140)
        }
        e2.snp.makeConstraints{make in
            make.top.equalTo(lawyersView.snp.bottom).offset(35)
            make.right.equalToSuperview().inset(17)
            make.width.height.equalTo(140)
        }
        e3.snp.makeConstraints{make in
            make.top.equalTo(e1.snp.bottom).offset(35)
            make.left.equalToSuperview().inset(17)
            make.width.height.equalTo(140)
        }
        e4.snp.makeConstraints{make in
            make.top.equalTo(e2.snp.bottom).offset(35)
            make.right.equalToSuperview().inset(17)
            make.width.height.equalTo(140)
        }
        recLabel.snp.makeConstraints{make in
            make.height.equalTo(18)
            make.centerX.equalTo(recentView.snp.centerX)
            make.top.equalTo(recentView.snp.bottom).offset(9)
        }
        lawLabel.snp.makeConstraints{make in
            make.height.equalTo(18)
            make.centerX.equalTo(lawyersView.snp.centerX)
            make.top.equalTo(lawyersView.snp.bottom).offset(9)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func setLawyers(cell: [Lawyer]){
        self.lawyers = cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return lawyers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell {
            cell.image.image = lawyers[indexPath.section].image
            cell.name.text = lawyers[indexPath.section].name
            cell.dirLabel.text = lawyers[indexPath.section].direction
            cell.expLabel.text = lawyers[indexPath.section].experience
            cell.selectionStyle = .none
            
            return cell
        } else {
            print("ERROR")
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        return v
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
    
}
