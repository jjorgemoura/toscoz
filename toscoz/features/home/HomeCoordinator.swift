//
//  HomeCoordinator.swift
//  toscoz
//
//  Created by Jorge Moura on 19/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import UIKit

class HomeCoordinator: RootCoordinator {

    let window: UIWindow
    var tabViewController = UITabBarController()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {

        let homeViewController = HomeViewController()
        let playerViewController = PlayerViewController()
        playerViewController.hidesBottomBarWhenPushed = true
//        let playerViewController2 = PlayerCoordinator(window: window).playerSliderViewController
        let searchViewController = SearchViewController()

        let homeNavigationController = UINavigationController(rootViewController: homeViewController)

        let controllers: [UIViewController] = [homeNavigationController, playerViewController, searchViewController]
        tabViewController.viewControllers = controllers

        let homeTabBarItem = UITabBarItem(title: "home", image: nil, tag: 1)
        let playTabBarItem = UITabBarItem(title: "play", image: nil, tag: 1)
        let searchTabBarItem = UITabBarItem(title: "search", image: nil, tag: 1)

        homeViewController.tabBarItem = homeTabBarItem
        playerViewController.tabBarItem = playTabBarItem
        searchViewController.tabBarItem = searchTabBarItem

        let homeViewModel: HomeViewModel = StandardHomeViewModel(navigationController: homeNavigationController)
        homeViewController.viewModel = homeViewModel

        window.rootViewController = tabViewController
    }
}
