//
//  ProfileCoordinator.swift
//  Law
//
//  Created by Adilet on 18/6/23.
//

import UIKit
import SnapKit

class ProfileCoordinator: Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ProfileViewController()
        vc.tabBarItem = TabBarItems.third.tabbarItem
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: -28, bottom: 0, right: 28)
//        vc.navigationController?.hidesBarsOnSwipe = true
        navigationController.hidesBarsOnSwipe = true
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    
    
}

