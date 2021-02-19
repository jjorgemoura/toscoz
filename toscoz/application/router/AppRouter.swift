//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

struct AppRouter: Router {

    let appUIWindow: UIWindow
    let eventHandler: EventHandler

    let mainNavigarionViewController = UINavigationController()

    //            let rootViewController = TopAlbumsViewController()
    //            let rootViewController = AlbumsViewController()

    func presentRoot() {
        let viewModel = TopAlbumsViewModel()
        let viewController = TopAlbumsViewController(viewModel: viewModel, eventHandler: eventHandler)
        mainNavigarionViewController.pushViewController(viewController, animated: true)

        appUIWindow.rootViewController = mainNavigarionViewController
    }

    func showAlbumScreen(with album: String) {
        let viewModel = AlbumsViewModel()
        let viewController = AlbumsViewController(viewModel: viewModel, eventHandler: eventHandler)

        mainNavigarionViewController.pushViewController(viewController, animated: true)
    }
}
