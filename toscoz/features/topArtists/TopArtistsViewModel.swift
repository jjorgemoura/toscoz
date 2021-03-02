//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Combine
import Foundation

class TopArtistsViewModel {
    private let appStateHolder: AppStateHolder
    private var cancellable: AnyCancellable?

    private(set) var items: [Artist] = []

    var dataDidLoad: (() -> Void)?

    init(appStateHolder: AppStateHolder) {
        self.appStateHolder = appStateHolder
    }

    deinit {
        print("Top Albums VM -> deinit")
    }

    func refresh() {
        cancellable = appStateHolder.appStatePublisher.sink { [weak self] appState in
            self?.items = appState.topArtists

//            print(Thread.isMainThread)
            self?.dataDidLoad?()
        }
    }
}
