//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

struct AppCore {

    let appStateHolder: AppStateHolder
    let eventHandler: EventHandler & EventRegister
    let router: Router

    func setupDependencies() {
        let authRepo = AuthenticationRepo.live
        let topArtistsRepo = TopArtistsRepo.live

        let interactorEventRegistry = InteractorEventRegistry(eventHandler: eventHandler)

        let applicationInteractor = ApplicationInteractor(appStateHolder: appStateHolder, authenticationRepo: authRepo, router: router)
        let topArtistsInteractor = TopArtistsInteractor(appStateHolder: appStateHolder, router: router, topArtistsRepo: topArtistsRepo)

        interactorEventRegistry.register(interactor: applicationInteractor)
        interactorEventRegistry.register(interactor: topArtistsInteractor)
    }
}

struct InteractorEventRegistry {

    let eventHandler: EventRegister

    func register(interactor: ApplicationInteractor) {
        eventHandler.register { (event: AppStarted) in interactor.onEvent(event: event) }
        eventHandler.register { (event: SignInSelected) in interactor.onEvent(event: event) }
        eventHandler.register { (event: AuthTokenResponse) in interactor.onEvent(event: event) }
    }

    func register(interactor: TopArtistsInteractor) {
        eventHandler.register { (event: TopArtistsRequestCompleted) in interactor.onEvent(event: event) }
        eventHandler.register { (event: TopArtistsPresented) in interactor.onEvent(event: event) }
        eventHandler.register { (event: TopArtistsTapped) in interactor.onEvent(event: event) }
    }
}
