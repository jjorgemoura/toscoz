//
//  Coordinator.swift
//  toscoz
//
//  Created by Jorge Moura on 16/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import UIKit

protocol Coordinator {
    func start()
}

protocol RootCoordinator: Coordinator {
    var window: UIWindow { get }
}

protocol NavigationCoordinator: Coordinator {
    var navigationController: UINavigationController { get }
}
