//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import ComposableArchitecture
import SwiftUI
import alfaz
import alfazLive

@main
struct ToscozApp: App {
    let liveStore = Store(initialState: AppState(topArtists: []),
                          reducer: appReducer,
                          environment: AppEnvironment(networkClient: .live))

    var body: some Scene {
        WindowGroup {
            MyTopView(store: liveStore)
        }
    }
}
