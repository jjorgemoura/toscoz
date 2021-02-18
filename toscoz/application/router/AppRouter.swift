//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

struct AppRouter: Router {

    private let eventHandler: EventHandler
    private let navigationViewController: UINavigationController

    func presentRoot() {
    }

    func showAlbumScreen(with album: String) {
        let viewModel = AlbumsViewModel()
        let viewController = AlbumsViewController(viewModel: viewModel, eventHandler: eventHandler)

        navigationViewController.pushViewController(viewController, animated: true)
    }
}
