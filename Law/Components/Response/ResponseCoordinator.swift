//
//  ResponseCoordinator.swift
//  MusicApp
//
//  Created by Adilet on 28/5/23.
//

import UIKit

class ResponseCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController

    var finishDelegate: CoordinatorFinishDelegate?

    var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ResponseViewController()
        vc.coordinator = self
        vc.tabBarItem = TabBarItems.second.tabbarItem
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        vc.navigationController?.hidesBarsOnSwipe = true
        navigationController.hidesBarsOnSwipe = true
        navigationController.pushViewController(vc, animated: true)
    }

}
