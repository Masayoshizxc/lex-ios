//
//  BaseViewController.swift
//  Law
//
//  Created by Adilet on 15/6/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let back = UIBarButtonItem()
        back.title = ""
        back.tintColor = .blue
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = back
    }
    
}
