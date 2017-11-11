//
//  AuthenticationViewController.swift
//  toscoz
//
//  Created by Jorge Moura on 21/10/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class AuthenticationViewController: UIViewController {

    private let bag: DisposeBag = DisposeBag()
    var viewModel: AuthenticationViewModel?

    @IBOutlet private var loginButton: UIButton!
    @IBOutlet private var cancelButton: UIButton!
    @IBOutlet private var usernameControl: UITextField!
    @IBOutlet private var passwordControl: UITextField!

    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupBindings()
    }

    // MARK: - Provate methods
    private func setupUI() {
        navigationItem.title = "Login"

        let pButton = PrimaryButton()
        let style = Styler(with: pButton)
        loginButton?.apply(style: style)
        usernameControl?.apply(style: style)

    }

    private func setupBindings() {
//        viewModel.languages
//            .observeOn(MainScheduler.instance)
//            .bind(to: tableView.rx.items(cellIdentifier: "LanguageCell", cellType: UITableViewCell.self)) { (_, language, cell) in
//                cell.textLabel?.text = language
//                cell.selectionStyle = .none
//            }
//            .disposed(by: disposeBag)

        if let viewModel = viewModel {
            cancelButton?.rx.tap
                .bind(to: viewModel.cancel)
                .disposed(by: bag)

            loginButton?.rx.tap
                .bind(to: viewModel.cancel)
                .disposed(by: bag)
        }
    }
}
