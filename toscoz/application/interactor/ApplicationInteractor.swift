//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

struct ApplicationInteractor {
    let appStateHolder: AppStateHolder
    let authenticationRepo: AuthenticationRepo
    let router: Router

    func onEvent(event: AppStarted) {
        router.presentAuthentication()
    }

    func onEvent(event: SignInSelected) {
        authenticationRepo.authenticate()
    }

    func onEvent(event: AuthTokenResponse) {
        let authentication = Authentication(token: event.token, expireAt: "")
        let newState = AppState(authentication: authentication, topArtists: appStateHolder.appState.topArtists)
        appStateHolder.update(to: newState)
        router.presentRoot()
    }
}
