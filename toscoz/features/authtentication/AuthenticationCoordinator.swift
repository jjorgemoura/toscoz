//
//  AuthenticationCoordinator.swift
//  toscoz
//
//  Created by Jorge Moura on 22/10/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift
import UIKit

class AuthenticationCoordinator: Coordinator, Rootable {

    typealias T = AuthenticationCoordinatorResult

    let window: UIWindow
    var tabViewController: UITabBarController = UITabBarController()

    init(window: UIWindow) {
        self.window = window
    }

    func start() -> Observable<T> {
        let viewModel = AuthenticationDefaultViewModel()
        let viewController = AuthenticationViewController()
        viewController.viewModel = viewModel

        let whenCancel = viewModel.didCancel.map { _ -> AuthenticationCoordinatorResult in
            print("JM: 1")
            return AuthenticationCoordinatorResult.cancel
        }
        let whenLogin = viewModel.didAuthenticateSuccessfully.map { userToken -> AuthenticationCoordinatorResult in
            print("JM: 2")
            return AuthenticationCoordinatorResult.authenticationSuccessful(token: userToken)
        }

        window.rootViewController = viewController

        return Observable.merge(whenCancel, whenLogin)
            .take(1)
            .do(onNext: { [weak self] event in
                print("Event -> \(event) || Self -> \(self!)")
                //                self?.rootViewController.dismiss(animated: true)
            })
    }
}
