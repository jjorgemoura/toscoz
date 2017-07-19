//
//  PlayerPresenter.swift
//  toscoz
//
//  Created by Jorge Moura on 16/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import UIKit

class PlayerCoordinator: RootCoordinator {

    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let playerViewModel =  PlayerViewModel(song: "", startingPoint: 0)
        //viewModel.model = MVVMCAuthenticateModel()
        //viewModel.coordinatorDelegate = self
        //vc.viewModel = viewModel

        let viewController = PlayerViewController()
        viewController.playerViewModel = playerViewModel
        window.rootViewController = viewController
    }
}
