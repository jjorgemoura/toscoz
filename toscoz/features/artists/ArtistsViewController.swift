//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

class ArtistsViewController: UIViewController {

    private let viewModel: ArtistsViewModel
    private let eventHandler: EventHandler

    @IBOutlet private var albumLabel: UILabel?

    init(viewModel: ArtistsViewModel, eventHandler: EventHandler) {
        self.viewModel = viewModel
        self.eventHandler = eventHandler

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("Album VC -> deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green

        viewModel.dataDidLoad = { [weak self] artist in
            self?.albumLabel?.text = artist.name
        }

        albumLabel?.text = viewModel.artist?.name
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.refresh()
    }
}
