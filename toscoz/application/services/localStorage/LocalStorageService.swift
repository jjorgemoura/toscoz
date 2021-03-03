//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Combine
import Foundation

typealias LocalStorageKey = String

enum LocalStorageKeys {
    static let authentication = "toscoz.appstate.authentication"
}

class LocalStorageService {

//    private let appStateHolder: AppStateHolder
    private var cancellable: AnyCancellable?
    private let localStorage: LocalStorageClient

    init(localStorage: LocalStorageClient) {
        self.localStorage = localStorage
//        self.appStateHolder = appStateHolder
    }

    deinit {
        cancellable?.cancel()
        print("LocalStorageService -> deinit")
    }

    func start(appStateHolder: AppStateHolder) {
        cancellable = appStateHolder.appStatePublisher.sink { [weak self] appState in
            print("JM: The AppState -> \(appState)")
            
            guard let authentication = appState.authentication else { return }

            if let authenticationData = try? JSONEncoder().encode(authentication) {
                self?.localStorage.write(authenticationData, LocalStorageKeys.authentication)
            }
        }
    }

    func read() -> AppState? {
        guard let authenticationData = localStorage.read(LocalStorageKeys.authentication) else { return nil }
        let authentication = try? JSONDecoder().decode(Authentication.self, from: authenticationData)

        return AppState(authentication: authentication, topArtists: [])
    }
}
