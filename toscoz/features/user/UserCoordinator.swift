//
//  UserCoordinator.swift
//  toscoz
//
//  Created by Jorge Moura on 22/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift
import UIKit

class UserCoordinator: BaseCoordinator, Coordinator, Rootable {

    typealias T = UserCoordinatorResult

    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
        super.init()
        print("JM - 7 -> \(self)")
    }

    deinit {
        print("JM - D7 -> \(Unmanaged<AnyObject>.passUnretained(self as AnyObject).toOpaque())")
    }

    func start() -> Observable<T> {
        let viewModel = UserDefaultViewModel()
        let viewController = UserViewController()
        viewController.viewModel = viewModel

        let userNavigationController = UINavigationController(rootViewController: viewController)

        let whenGoToHomepage = viewModel.didPressGoToHomepage.map { _ -> UserCoordinatorResult in
            UserCoordinatorResult.home
        }
        let whenLogin = viewModel.didPressGoToAuthenticate.map { _ -> UserCoordinatorResult in
            UserCoordinatorResult.login
        }

        window.rootViewController = userNavigationController

        return Observable.merge(whenGoToHomepage, whenLogin)
            .take(1)
            .do(onNext: { [weak self] event in
                print("Event -> \(event) || Self -> \(self!)")
                self?.window.rootViewController = nil
            })
    }
}
