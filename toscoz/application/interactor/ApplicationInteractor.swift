//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

struct ApplicationInteractor {
    let appStateHolder: AppStateHolder
    let authenticationRepo: AuthenticationRepo
    let router: Router

    func onEvent(event: AppStarted) {
        // is the user authenticated
        // yes
//        router.presentRoot()

        // no
        // ask authentication
        router.presentAuthentication()
    }

    func onEvent(event: SignInSelected) {
        authenticationRepo.authenticate()
    }
}
