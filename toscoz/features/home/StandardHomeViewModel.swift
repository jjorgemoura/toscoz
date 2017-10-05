//
//  StandardHomeViewModel.swift
//  toscoz
//
//  Created by Jorge Moura on 22/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import UIKit

class StandardHomeViewModel: HomeViewModel {

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func userHomeSelected() {
        UserHomeCoordinator(navigationController: navigationController).start()
    }
}
