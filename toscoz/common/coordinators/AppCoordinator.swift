//
//  AppCoordinator.swift
//  toscoz
//
//  Created by Jorge Moura on 19/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift
import UIKit

class AppCoordinator: Coordinator, Rootable {

    typealias T = Void

    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() -> Observable<T> {
        appConfiguration()

        if isLoggedIn() {
            showHomepageScreen()
        } else {
            showLoginScreen()
        }

        return Observable.never()
    }

    // MARK: - private methods
    private func isLoggedIn() -> Bool {
        return true
    }

    private func showLoginScreen() {

    }

    private func showHomepageScreen() {
        let homeTabBarCoordinator = HomeTabBarCoordinator(window: window)

        homeTabBarCoordinator.start()
            .subscribe(onNext: { result in

                switch result {
                case HomeTabBarCoordinatorResult.logout:
                    self.showLoginScreen()
                }

            }, onError: { error in
                print(error.localizedDescription)
            }).disposed(by: DisposeBag())
    }

    private func appConfiguration() {

    }
}
