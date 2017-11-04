//
//  AppCoordinator.swift
//  toscoz
//
//  Created by Jorge Moura on 19/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift
import UIKit

/// The AppCoordinator is the startup coordinator, initialised in AppDelegate.
///
/// Being the root coordinator, AppCoordinator type is `Void`.
///
/// ````
/// typealias T = Void
/// ````
class AppCoordinator: Coordinator, Rootable {

    typealias T = Void

    let window: UIWindow

    /// The initialiser of the class.
    ///
    /// - Parameter window: The `UIWindow` needs to be init in the initialiser..
    init(window: UIWindow) {
        self.window = window
    }

    /// The method that starts the coordinator.
    ///
    /// - Returns: Result of the coordinator, `Void` in this coordinator.
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
        return false
    }

    private func showLoginScreen() {
        let authenticationCoordinator = AuthenticationCoordinator(window: window)

        authenticationCoordinator.start()
            .subscribe(onNext: { result in

                switch result {
                case .authenticationSuccessful(token: _):
                    self.showHomepageScreen()
                case .cancel:
                    self.showHomepageScreen()
                }

            }, onError: { error in
                print(error.localizedDescription)
            }).disposed(by: DisposeBag())
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
        window.apply(style: Styler(with: AppWindow()))
    }
}
