//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import ComposableArchitecture

struct AppReducer {

    // closure
    let main: Reducer<AppState, AppAction, AppEnvironment> = Reducer { state, action, environment in
        print(environment)

        switch action {
        case .settingsButtonTapped:
            state.showSettings = true
            return .none

        case .settingsScreenDismissed:
            state.showSettings = false
            return .none
        }

        // return side effect. return .none if no side effect
    }
    .debug()
}
