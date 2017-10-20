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

    func start() -> Observable<Void> {
        //Several inits

        if isLoggedIn() {
            let homeTabBarCoordinator = HomeTabBarCoordinator(window: window)

            homeTabBarCoordinator.start()
                .subscribe(onNext: { result in

                switch result {
                case HomeTabBarCoordinatorResult.logout:
                    self.showLogin()
                }

            }, onError: { error in
                print(error.localizedDescription)
            }).disposed(by: DisposeBag())
        }

        return Observable.never()
    }

    private func isLoggedIn() -> Bool {
        return true
    }

    private func showLogin() {

    }
}
