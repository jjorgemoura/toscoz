//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

struct TopAlbumsInteractor {

    let router: Router

    func onEvent(event: TopAlbumsPresented) {
        // load topAlbums
    }

    func onEvent(event: TopAlbumsTapped) {
        router.showAlbumScreen(with: event.albumId)
    }
}
