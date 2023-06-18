//
//  TableViewCell.swift
//  Law
//
//  Created by Adilet on 18/6/23.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    lazy var image: UIImageView = {
        let i = UIImageView()
        i.frame = CGRect(x: 0, y: 0, width: 55, height: 60)
        
        
        return i
    }()
    
    lazy var name: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 15)
        l.numberOfLines = 0
        
        return l
    }()
    private lazy var dirIcon: UIImageView = {
        let i = UIImageView()
        i.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        i.image = UIImage(named: "direction")
        return i
    }()
    private lazy var expIcon: UIImageView = {
        let i = UIImageView()
        i.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        i.image = UIImage(named: "experience")
        return i
    }()
    lazy var dirLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 13)
        l.numberOfLines = 0
        
        return l
    }()
    lazy var expLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 13)
        l.numberOfLines = 0
        
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TableViewCell {
    func setupSubviews() {
        contentView.addSubview(image)
        contentView.addSubview(name)
        contentView.addSubview(dirIcon)
        contentView.addSubview(expIcon)
        contentView.addSubview(dirLabel)
        contentView.addSubview(expLabel)
    }
    func setupConstraints() {
        image.snp.makeConstraints{make in
            make.top.left.equalToSuperview().inset(10)
            make.width.equalTo(55)
            make.height.equalTo(60)
        }
        name.snp.makeConstraints{make in
            make.height.equalTo(18)
            make.top.equalToSuperview().inset(10)
            make.left.equalTo(image.snp.right).offset(20)
        }
        name.snp.makeConstraints{make in
            make.height.equalTo(18)
            make.top.equalToSuperview().inset(10)
            make.left.equalTo(image.snp.right).offset(20)
        }
        dirIcon.snp.makeConstraints{make in
            make.top.equalTo(name.snp.bottom).offset(1)
            make.left.equalTo(image.snp.right).offset(20)
        }
        expIcon.snp.makeConstraints{make in
            make.top.equalTo(dirIcon.snp.bottom)
            make.left.equalTo(image.snp.right).offset(20)
        }
        dirLabel.snp.makeConstraints{make in
            make.left.equalTo(dirIcon.snp.right).offset(5)
            make.height.equalTo(16)
            make.centerY.equalTo(dirIcon)
        }
        expLabel.snp.makeConstraints{make in
            make.left.equalTo(expIcon.snp.right).offset(5)
            make.height.equalTo(16)
            make.centerY.equalTo(expIcon)
        }
    }
}
