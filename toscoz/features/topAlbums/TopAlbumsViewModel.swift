//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Combine
import Foundation

class TopAlbumsViewModel {
    private let appStateHolder: AppStateHolder
    private var cancellable: AnyCancellable?

    private(set) var items: [Album] = []

    var dataDidLoad: (() -> Void)?

    init(appStateHolder: AppStateHolder) {
        self.appStateHolder = appStateHolder
    }

    deinit {
        print("Top Albums VM -> deinit")
    }

    func refresh() {
        cancellable = appStateHolder.appStatePublisher.sink { [weak self] appState in
            self?.items = appState.topAlbums

//            print(Thread.isMainThread)
            self?.dataDidLoad?()
        }
    }
}
