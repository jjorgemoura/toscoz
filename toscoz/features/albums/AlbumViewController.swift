//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

class AlbumViewController: UIViewController {

    private let viewModel: AlbumViewModel
    private let eventHandler: EventHandler

    @IBOutlet private var albumLabel: UILabel?

    init(viewModel: AlbumViewModel, eventHandler: EventHandler) {
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

        viewModel.dataDidLoad = { [weak self] album in
            self?.albumLabel?.text = album.title
        }

        albumLabel?.text = viewModel.album?.title
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.refresh()
    }
}
