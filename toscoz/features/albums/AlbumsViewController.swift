//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

class AlbumsViewController: UIViewController {

    @IBOutlet private var albumLabel: UILabel?

    private let viewModel: AlbumsViewModel
    private let eventHandler: EventHandler

    init(viewModel: AlbumsViewModel, eventHandler: EventHandler) {
        self.viewModel = viewModel
        self.eventHandler = eventHandler

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green

        albumLabel?.text = viewModel.album
    }
}
