//
//  PlayerCoordinator.swift
//  toscoz
//
//  Created by Jorge Moura on 16/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import UIKit

class PlayerCoordinator {

//    private var playerSliderViewControllers: [UIViewController] = []
//
//    let window: UIWindow
//    let playerSliderViewController: UIPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
//
//    init(window: UIWindow) {
//        self.window = window
//    }
//
//    func start() {
//        //VC 1
//        let albumViewController = PlayerAlbumViewController()
//
//        //VC 2
//        let playerViewModel = PlayerViewModel(song: "", startingPoint: 0)
//        //viewModel.model = MVVMCAuthenticateModel()
//        //viewModel.coordinatorDelegate = self
//        //vc.viewModel = viewModel
//
//        let playerViewController = PlayerViewController()
//        playerViewController.title = "sdfasdfsdf"
//        playerViewController.playerViewModel = playerViewModel
//
//        //VC 3
//        let technicalInfoViewController = TechnicalInfoViewController()
//
//        //Set ViewControllers List
//        playerSliderViewControllers = [albumViewController, playerViewController, technicalInfoViewController]
//
////        //Set PageViewController
////        let options: [String: Any] = [:]
//
//        playerSliderViewController.dataSource = self
////        playerSliderViewController.delegate = self
//        playerSliderViewController.setViewControllers([playerViewController], direction: .forward, animated: false)
//
//        window.rootViewController = playerSliderViewController
//
////        let proxy = UIPageControl.appearance()
////        proxy.pageIndicatorTintColor = UIColor.red.withAlphaComponent(0.6)
////        proxy.currentPageIndicatorTintColor = .red
////        proxy.backgroundColor = .yellow
//    }
}

//extension PlayerCoordinator: UIPageViewControllerDataSource {
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return playerSliderViewControllers.count
//    }
//
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        if let viewController = pageViewController.viewControllers?.first {
//            return playerSliderViewControllers.index(of: viewController) ?? 0
//        }
//        return 0
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        if playerSliderViewControllers.contains(viewController) {
//            if let index = playerSliderViewControllers.index(of: viewController) {
//                var beforeIndex = 0
//                if index > playerSliderViewControllers.startIndex {
//                    beforeIndex = playerSliderViewControllers.index(before: index)
//                    return playerSliderViewControllers[beforeIndex]
//                }
//            }
//        }
//        return nil
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        if playerSliderViewControllers.contains(viewController) {
//            if let index = playerSliderViewControllers.index(of: viewController) {
//                var afterIndex = 0
//                if index < playerSliderViewControllers.count - 1 {
//                    afterIndex = playerSliderViewControllers.index(after: index)
//                    return playerSliderViewControllers[afterIndex]
//                }
//            }
//        }
//        return nil
//    }
//}

//extension PlayerCoordinator: UIPageViewControllerDelegate {
//
//}
