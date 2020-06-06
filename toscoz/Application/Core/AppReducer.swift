//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import ComposableArchitecture

struct AppReducer {

    // closure
    let main: Reducer<AppState, AppAction, AppEnvironment> = Reducer { state, action, environment in
        print(environment)

        switch action {
        case .autorize:
            return SpotifyClient.live
                .authorize()
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(AppAction.autorizeGrantedResult)

        case let .autorizeGrantedResult(result):
            print("-------")
            print(result)
            print("-------")
            return .none

        case .loadMyAlbums:
            return SpotifyClient.live
                .myAlbums("sdasddasd")
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(AppAction.loadMyalbumsResponse)

        case let .loadMyalbumsResponse(.success(albums)):
            print("-------")
            print(albums)
            print("-------")
            return .none

        case let .loadMyalbumsResponse(.failure(error)):
            print("-------")
            print(error)
            print("-------")
            return .none

        case .settingsButtonTapped:
            state.showSettings = true
            return .none

        case .settingsScreenDismissed:
            state.showSettings = false
            return .none

        // return side effect. return .none if no side effect
        }
    }
    .debug()
}
