//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation
import Combine

struct TopAlbumsInteractor {

    static var cancellables: Set<AnyCancellable> = []

    let appStateHolder: AppStateHolder
    let router: Router
    let topAlbumsRepo: TopAlbumsRepo
//    var cancellables: Set<AnyCancellable> = []

    func onEvent(event: TopAlbumsPresented) {
//        let topAlbums: [Album] = [
//            Album(identifier: UUID(), title: "Animals", artist: "Pink Floyd", year: "1977"),
        //            Album(identifier: UUID(), title: "Closer", artist: "Joy Division", year: "1980"),
        //            Album(identifier: UUID(), title: "The Top", artist: "The Cure", year: "1984")
        //        ]
        //        let newState = AppState(authentication: nil, topAlbums: topAlbums)
        //        appStateHolder.update(to: newState)

        guard let token = appStateHolder.appState.authentication?.token else { return }

        topAlbumsRepo.topAlbums(token)
            .sink { error in
                print(error)
            } receiveValue: { response in
                print(response)
            }
            .store(in: &TopAlbumsInteractor.cancellables)
    }

    func onEvent(event: TopAlbumsTapped) {
        router.showAlbumScreen(with: event.albumId)
    }
}
