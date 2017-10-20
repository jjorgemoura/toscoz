//
//  UserHomeCoordinator.swift
//  toscoz
//
//  Created by Jorge Moura on 22/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift
import UIKit

class UserHomeCoordinator: Coordinator {

    typealias T = String

    func start() -> Observable<String> {
        return Observable.just("XPTO")
    }

//    private var userViewController: UserViewController?
//
//    let navigationController: UINavigationController
//
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//
//    func start() {
//        userViewController = UserViewController()
//        navigationController.pushViewController(userViewController!, animated: true)
//    }
}
