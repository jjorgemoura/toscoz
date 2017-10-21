//
//  HomeTabBarCoordinator.swift
//  toscoz
//
//  Created by Jorge Moura on 20/10/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift
import UIKit

enum HomeTabBarCoordinatorResult {
    case logout
}

class HomeTabBarCoordinator: Coordinator, Rootable {

    typealias T = HomeTabBarCoordinatorResult

    let window: UIWindow
    var tabViewController: UITabBarController = UITabBarController()

    init(window: UIWindow) {
        self.window = window
    }

    func start() -> Observable<T> {

        let homeViewController = HomeViewController()
        let searchViewController = SearchViewController()
        let playerViewController = PlayerViewController()
//        playerViewController.hidesBottomBarWhenPushed = true

        let homeNavigationController = UINavigationController(rootViewController: homeViewController)

        let controllers: [UIViewController] = [homeNavigationController, playerViewController, searchViewController]
        tabViewController.viewControllers = controllers

        let homeTabBarItem = UITabBarItem(title: "home", image: nil, tag: 1)
        let playTabBarItem = UITabBarItem(title: "play", image: nil, tag: 2)
        let searchTabBarItem = UITabBarItem(title: "search", image: nil, tag: 3)

        homeViewController.tabBarItem = homeTabBarItem
        playerViewController.tabBarItem = playTabBarItem
        searchViewController.tabBarItem = searchTabBarItem

        homeViewController.viewModel = HomeDefaultViewModel(navigationController: homeNavigationController)
        searchViewController.searchViewModel = SearchDefaultViewModel()

        window.rootViewController = tabViewController

        return Observable.never()
    }
}
