//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation
import Combine

struct TopArtistsInteractor {

    static var cancellables: Set<AnyCancellable> = []

    let appStateHolder: AppStateHolder
    let router: Router
    let topArtistsRepo: TopArtistsRepo
//    var cancellables: Set<AnyCancellable> = []

    func onEvent(event: TopArtistsPresented) {

        guard let token = appStateHolder.appState.authentication?.token else { return }

        topArtistsRepo.topArtists(token)
            .map { reponseObject in
                reponseObject.toModel()
            }
            .sink { error in
                print(error)
            } receiveValue: { artists in
                print(artists)
                onEvent(event: TopArtistsLoaded(topArtists: artists))
            }
            .store(in: &TopArtistsInteractor.cancellables)
    }

    func onEvent(event: TopArtistsLoaded) {
        let artists: [Artist] = event.topArtists
        let newState = AppState(authentication: nil, topArtists: artists)
        appStateHolder.update(to: newState)
    }

    func onEvent(event: TopArtistsTapped) {
        router.showAlbumScreen(with: event.albumId)
    }
}
