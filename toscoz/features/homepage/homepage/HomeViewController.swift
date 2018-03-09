//
//  HomeViewController.swift
//  toscoz
//
//  Created by Jorge Moura on 21/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var viewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home - Jorge"

        let userBarButton = UIBarButtonItem(title: "user", style: .plain, target: self, action: #selector(selectUser))
        navigationItem.leftBarButtonItem = userBarButton

        let settingBarButton = UIBarButtonItem(title: "setting", style: .plain, target: self, action: #selector(selectSettings))
        navigationItem.rightBarButtonItem = settingBarButton
    }

    @objc
    func selectUser() {
        print("HomeViewController -> select User")
        if let viewModel = viewModel {
            viewModel.userHomeSelected()
        }
    }

    @objc
    func selectSettings() {
        print("HomeViewController -> select Settings")
    }
}
