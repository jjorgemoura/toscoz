//
//  UserViewController.swift
//  toscoz
//
//  Created by Jorge Moura on 22/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift
import UIKit

class UserViewController: UIViewController {

    private let bag: DisposeBag = DisposeBag()
    var viewModel: UserViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "User - Jorge"

        let homeBarButton = UIBarButtonItem(title: "home", style: .plain, target: self, action: #selector(selectHome))
        navigationItem.leftBarButtonItem = homeBarButton

        let loginBarButton = UIBarButtonItem(title: "login", style: .plain, target: self, action: #selector(selectLogin))
        navigationItem.rightBarButtonItem = loginBarButton
    }

    @objc
    func selectLogin() {
        if let viewModel = viewModel {
            viewModel.authenticate.onNext(())
        }
    }

    @objc
    func selectHome() {
        if let viewModel = viewModel {
            viewModel.homepage.onNext(())
        }
    }
}
