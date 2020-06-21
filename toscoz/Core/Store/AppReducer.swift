//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import ComposableArchitecture

struct AppReducer {

    let main: Reducer<AppState, AppAction, AppEnvironment> = Reducer { state, action, environment in

        switch action {
        case .autorize:
            SpotifyClient.live.authorize()
            return .none

        case .loadMyAlbums:
            return SpotifyClient.live
                .myAlbums("sdasddasd")
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(AppAction.loadMyalbumsResponse)

        case let .loadMyalbumsResponse(.success(albumResponse)):
            print("-------")
            state.myAlbums = albumResponse.items.map { $0.album }
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
        }
    }
    .debug()
}
