//
//  AppCoordinator.swift
//  toscoz
//
//  Created by Jorge Moura on 19/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator, Rootable {
    
    typealias T = Void
    

    let window: UIWindow
    
    var playerCoordinator: PlayerCoordinator?
    var homeCoordinator: HomeCoordinator?

    init(window: UIWindow) {
        self.window = window
    }
    
    

//    func start() {
//        if isSongPlaying() {
//            playerCoordinator = PlayerCoordinator(window: window)
//            playerCoordinator?.start()
//        } else {
//            homeCoordinator = HomeCoordinator(window: window)
//            homeCoordinator?.start()
//        }
//    }
//
//    // MARK: - Private methods
//    private func isSongPlaying() -> Bool {
//        return false
//    }
}
