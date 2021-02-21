//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

struct AppRouter: Router {

    let appUIWindow: UIWindow
    let appStateHolder: AppStateHolder
    let eventHandler: EventHandler

    let mainNavigarionViewController = UINavigationController()

    func presentAuthentication() {
        let authenticationViewController = AuthenticationViewController(eventHandler: eventHandler)

        appUIWindow.rootViewController = authenticationViewController
    }

    func presentRoot() {
        let viewModel = TopAlbumsViewModel(appStateHolder: appStateHolder)
        let viewController = TopAlbumsViewController(viewModel: viewModel, eventHandler: eventHandler)
        mainNavigarionViewController.pushViewController(viewController, animated: true)

        appUIWindow.rootViewController = mainNavigarionViewController
    }

    func showAlbumScreen(with album: UUID) {
        let viewModel = AlbumViewModel(appStateHolder: appStateHolder, albumId: album)
        let viewController = AlbumViewController(viewModel: viewModel, eventHandler: eventHandler)

        mainNavigarionViewController.pushViewController(viewController, animated: true)
    }
}
