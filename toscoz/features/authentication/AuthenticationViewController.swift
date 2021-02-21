//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

class AuthenticationViewController: UIViewController {

    private let eventHandler: EventHandler

    @IBOutlet private var descriptionLabel: UILabel?
    @IBOutlet private var authButton: UIButton?

    init(eventHandler: EventHandler) {
        self.eventHandler = eventHandler

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("Auth VC -> deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemTeal

        descriptionLabel?.text = "Please, login via your local spotify up"
        authButton?.addTarget(self, action: #selector(loginTapped(_:)), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @objc
    func loginTapped(_ sender: UIButton) {
        eventHandler.post(event: SignInSelected())
    }
}
