//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Combine

class AppStateHolder {
    private(set) var appState: AppState

    var appStatePublisher = CurrentValueSubject<AppState, Never>(AppState.initialState)

    init(appState: AppState) {
        self.appState = appState
    }

    func update(to newState: AppState) {
        appState = newState
        appStatePublisher.send(newState)
    }
}
