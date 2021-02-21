//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation

struct TopAlbumsInteractor {
    let appStateHolder: AppStateHolder
    let router: Router

    func onEvent(event: TopAlbumsPresented) {
        let topAlbums: [Album] = [
            Album(identifier: UUID(), title: "Animals", artist: "Pink Floyd", year: "1977"),
            Album(identifier: UUID(), title: "Closer", artist: "Joy Division", year: "1980"),
            Album(identifier: UUID(), title: "The Top", artist: "The Cure", year: "1984")
        ]
        let newState = AppState(authentication: nil, topAlbums: topAlbums)
        appStateHolder.update(to: newState)
    }

    func onEvent(event: TopAlbumsTapped) {
        router.showAlbumScreen(with: event.albumId)
    }
}
