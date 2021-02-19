//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

class AlbumsViewController: UIViewController {

    private let viewModel: AlbumsViewModel
    private let eventHandler: EventHandler

    @IBOutlet private var albumLabel: UILabel?

    init(viewModel: AlbumsViewModel, eventHandler: EventHandler) {
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

        albumLabel?.text = viewModel.album
    }
}
