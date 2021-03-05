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

        view.backgroundColor = .appSecondary

        descriptionLabel?.text = "Please, login via your local spotify app"
        descriptionLabel?.textColor = .appTextOnSecondary
        descriptionLabel?.textAlignment = .center
        descriptionLabel?.font = .appMessageTitle
        descriptionLabel?.numberOfLines = 3

        authButton?.addTarget(self, action: #selector(loginTapped(_:)), for: .touchUpInside)
        authButton?.setTitle("LOG IN TO SPOTIFY", for: .normal)//
        authButton?.setTitleColor(.appTextOnPrimary, for: .normal)
        authButton?.titleLabel?.font = .appActionButton
        authButton?.backgroundColor = .appPrimary
        authButton?.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        authButton?.layer.cornerRadius = 20
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @objc
    func loginTapped(_ sender: UIButton) {
        eventHandler.post(event: SignInSelected())
    }
}
