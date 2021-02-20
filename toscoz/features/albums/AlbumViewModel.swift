//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Combine
import Foundation

class AlbumViewModel {
    private let appStateHolder: AppStateHolder
    private var cancellable: AnyCancellable?

    private let albumId: UUID
    var album: Album?
    var dataDidLoad: ((Album) -> Void)?

    init(appStateHolder: AppStateHolder, albumId: UUID) {
        self.appStateHolder = appStateHolder
        self.albumId = albumId
    }

    deinit {
        cancellable?.cancel()
        print("Album VM -> deinit")
    }

    func refresh() {
        cancellable = appStateHolder.appStatePublisher.sink { [weak self] appState in
            let album = appState.topAlbums.first { album in
                album.identifier == self?.albumId
            }

            self?.album = album
            //            print(Thread.isMainThread)
            if let album = album {
                self?.dataDidLoad?(album)
            }
        }
    }
}
