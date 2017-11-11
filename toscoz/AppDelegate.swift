//
//  AppDelegate.swift
//  toscoz
//
//  Created by Jorge Moura on 17/06/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift
import UIKit

/// The application AppDelegate.
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let disposeBag: DisposeBag = DisposeBag()
    private var appCoordinator: AppCoordinator?

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        if let window = window {
            appCoordinator = AppCoordinator(window: window)
            appCoordinator?.start()
                .subscribe()
                .disposed(by: disposeBag)

            window.makeKeyAndVisible()
        }
        return true
    }
}
