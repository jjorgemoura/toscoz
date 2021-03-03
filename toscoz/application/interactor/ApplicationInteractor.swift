//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation

struct ApplicationInteractor {
    let appStateHolder: AppStateHolder
    let authenticationRepo: AuthenticationRepo
    let router: Router

    func onEvent(event: AppStarted) {
        if let tokenValidDate = appStateHolder.appState.authentication?.expireAt, tokenValidDate > Date() {
            print("JM: ApplicationInteractor -> AppStarted -> Token is still valid")
            router.presentRoot()
        } else {
            print("JM: ApplicationInteractor -> AppStarted -> NO TOKEN")
            router.presentAuthentication()
        }
    }

    func onEvent(event: SignInSelected) {
        if let tokenValidDate = appStateHolder.appState.authentication?.expireAt, tokenValidDate > Date() {
            print("JM: ApplicationInteractor -> SignInSelected -> Token is still valid")
            router.presentRoot()
        } else {
            print("JM: ApplicationInteractor -> SignInSelected -> Needs to Authenticate")
            authenticationRepo.authenticate()
        }
    }

    func onEvent(event: AuthTokenResponse) {
        let authentication = Authentication(token: event.token, expireAt: Date(timeInterval: SpotifyConfig.tokenLifetimeSeconds, since: Date()))
        let newState = AppState(authentication: authentication, topArtists: appStateHolder.appState.topArtists)
        appStateHolder.update(to: newState)
        router.presentRoot()
    }
}
