//
//  PlayerViewController.swift
//  toscoz
//
//  Created by Jorge Moura on 19/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    var playerViewModel: PlayerViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange

//        hidesBottomBarWhenPushed = true
        tabBarController?.tabBar.isHidden = true

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.getSwipeAction(_:)))
        swipeDown.direction = .down

        self.view.addGestureRecognizer(swipeDown)
    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }

    @objc
    func getSwipeAction(_ recognizer: UISwipeGestureRecognizer) {
        if recognizer.direction == .down {
            print("SDFASDGSDG")
//            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
////                appDelegate.appCoordinator?.start()
//            }
        }
    }
}
