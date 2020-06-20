//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct AuthorizeView: View {

    let store: Store<AppState, AppAction>

    var body: some View {

        WithViewStore(self.store) { viewStore in
            VStack {
                Text("Authorize on Spotify ...")
                    .foregroundColor(.green)
            }
            .onAppear { viewStore.send(.autorize) }
        }
    }
}

struct AuthorizeView_Previews: PreviewProvider {

    static let demoStore = Store(initialState: AppState(myAlbums: CannedData.albums, showSettings: false, settings: SettingsPageBuilder.build(version: "")),
                                 reducer: AppReducer().main,
                                 environment: AppEnvironment(mainQueue: DispatchQueue.main.eraseToAnyScheduler(), appVersion: "4.6.4", authenticationToken: ""))

    static var previews: some View {
        Group {
            AuthorizeView(store: demoStore)
            AuthorizeView(store: demoStore)
                .colorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}
