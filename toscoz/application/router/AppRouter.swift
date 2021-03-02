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
        let viewModel = TopArtistsViewModel(appStateHolder: appStateHolder)
        let viewController = TopArtistsViewController(viewModel: viewModel, eventHandler: eventHandler)
        mainNavigarionViewController.pushViewController(viewController, animated: true)

        appUIWindow.rootViewController = mainNavigarionViewController
    }

    func showAlbumScreen(with artistId: String) {
        let viewModel = ArtistsViewModel(appStateHolder: appStateHolder, artistId: artistId)
        let viewController = ArtistsViewController(viewModel: viewModel, eventHandler: eventHandler)

        mainNavigarionViewController.pushViewController(viewController, animated: true)
    }
}
