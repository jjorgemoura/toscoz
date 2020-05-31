//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct SettingsView: View {

    let store: Store<AppState, AppAction>

    var body: some View {

        WithViewStore(self.store) { viewState in

//            Text("sadzssa -> \(viewState.settings.type.rawValue)")

            NavigationView {
//                List(viewState.groups.footer) { setting in
//                    Text(setting)
//                }

                Text("sadzssa -> \(viewState.settings.type.rawValue)")
                .navigationBarTitle("Settings")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static let demoStore = Store(initialState: AppState(showSettings: false, myAlbums: CannedData.albums, settings: SettingsPageBuilder.build(version: "")),
                                 reducer: AppReducer().main,
                                 environment: AppEnvironment(appVersion: "4.6.4"))

    static var previews: some View {
        Group {
            SettingsView(store: demoStore)
            SettingsView(store: demoStore)
                .colorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}
