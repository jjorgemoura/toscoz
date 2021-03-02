//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Combine
import Foundation

class ArtistsViewModel {
    private let appStateHolder: AppStateHolder
    private var cancellable: AnyCancellable?

    private let artistId: String
    var artist: Artist?
    var dataDidLoad: ((Artist) -> Void)?

    init(appStateHolder: AppStateHolder, artistId: String) {
        self.appStateHolder = appStateHolder
        self.artistId = artistId
    }

    deinit {
        cancellable?.cancel()
        print("Album VM -> deinit")
    }

    func refresh() {
        cancellable = appStateHolder.appStatePublisher.sink { [weak self] appState in
            let album = appState.topArtists.first { album in
                album.identifier == self?.artistId
            }

            self?.artist = album
            //            print(Thread.isMainThread)
            if let album = album {
                self?.dataDidLoad?(album)
            }
        }
    }
}
