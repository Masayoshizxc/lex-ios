//
//  HomeCoordinator.swift
//  MusicApp
//
//  Created by Adilet on 28/5/23.
//

import UIKit

class HomeCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController

    var finishDelegate: CoordinatorFinishDelegate?

    var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        print("HomeCoordinator")
        let vc = HomeViewController()
        vc.coordinator = self
        vc.tabBarItem = TabBarItems.first.tabbarItem
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: -28)
//        vc.navigationController?.hidesBarsOnSwipe = true
        navigationController.hidesBarsOnSwipe = true
        navigationController.pushViewController(vc, animated: true)
    }

}
