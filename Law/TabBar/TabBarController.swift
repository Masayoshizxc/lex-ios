//
//  TabBarController.swift
//  Law
//
//  Created by Adilet on 18/6/23.
//

import UIKit

enum TabBarItems: CaseIterable {
    case first
    case second
    case third

    var tabbarItem: UITabBarItem {
        switch self {
        case .first:
            return .init(
                title: nil,
                image: UIImage(named: "homePage"),
                tag: 1
            )

        case .second:
            return .init(
                title: nil,
                image: UIImage(named: "responsePage"),
                tag: 1
            )
        case .third:
            return .init(
                title: nil,
                image: UIImage(named: "profilePage"),
                tag: 1
            )
        }
    }
}

class TabBarController: UITabBarController {
    weak var coordinator: TabBarCoordinator?

    let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
    let responseCoordinator = ResponseCoordinator(navigationController: UINavigationController())
    let profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        configureTabs()
        UITabBar.appearance().tintColor = .clickedGray
        UITabBar.appearance().unselectedItemTintColor = .white
        
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.backgroundColor = .white
        tabBarController?.tabBar.isTranslucent = true
//        tabBarController?.tabBar.backgroundColor = .none

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    private func configureTabs() {
        homeCoordinator.start()
        responseCoordinator.start()
        profileCoordinator.start()

        viewControllers = [
            homeCoordinator.navigationController,
            responseCoordinator.navigationController,
            profileCoordinator.navigationController
        ]
        tabBar.alpha = 0.95
        let tab = UITabBarAppearance()
        tab.backgroundEffect = .none
        tab.shadowColor = .clear

        tab.stackedItemWidth = 50
        tab.stackedItemSpacing = 50
//        tab.stackedItemPositioning =

        tabBar.standardAppearance = tab
//        tabBar.scrollEdgeAppearance = tab

    }

    private func setupConstraints() {
        let positionOnX: CGFloat = 59
        let positionOnY: CGFloat = 22
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2

        let bg = UIView()
        bg.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        bg.layer.cornerRadius = 16
        bg.layer.opacity = 40
        tabBar.addSubview(bg)
        let clicked = UIView()
        clicked.backgroundColor = .white
        clicked.layer.cornerRadius = 15
        bg.snp.makeConstraints {make in
            make.width.equalTo(296)
            make.height.equalTo(70)
            make.left.right.equalToSuperview().inset(59)
            make.bottom.equalToSuperview().inset(30)
        }
//        clicked.snp.makeConstraints {make in
//            make.width.equalTo(106)
//            make.height.equalTo(83)
//        }
//        bg.addSubview(clicked)

    }

}
