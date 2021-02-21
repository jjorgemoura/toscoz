//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

struct AppCore {

    let appStateHolder: AppStateHolder
    let eventHandler: EventHandler & EventRegister
    let router: Router

    func setupDependencies() {
        let authRepo = AuthenticationRepo.live
        let topAlbumsRepo = TopAlbumsRepo.live

        let interactorEventRegistry = InteractorEventRegistry(eventHandler: eventHandler)

        let applicationInteractor = ApplicationInteractor(appStateHolder: appStateHolder, authenticationRepo: authRepo, router: router)
        let topAlbumsInteractor = TopAlbumsInteractor(appStateHolder: appStateHolder, router: router, topAlbumsRepo: topAlbumsRepo)

        interactorEventRegistry.register(interactor: applicationInteractor)
        interactorEventRegistry.register(interactor: topAlbumsInteractor)
    }
}

struct InteractorEventRegistry {

    let eventHandler: EventRegister

    func register(interactor: ApplicationInteractor) {
        eventHandler.register { (event: AppStarted) in interactor.onEvent(event: event) }
        eventHandler.register { (event: SignInSelected) in interactor.onEvent(event: event) }
        eventHandler.register { (event: AuthTokenResponse) in interactor.onEvent(event: event) }
    }

    func register(interactor: TopAlbumsInteractor) {
        eventHandler.register { (event: TopAlbumsPresented) in interactor.onEvent(event: event) }
        eventHandler.register { (event: TopAlbumsTapped) in interactor.onEvent(event: event) }
    }
}
