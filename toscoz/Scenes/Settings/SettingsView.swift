//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct SettingsView: View {

    let store: Store<AppState, AppAction>

    var body: some View {

        WithViewStore(self.store) { viewStore in

            NavigationView {
                List {
                    ForEach(viewStore.settings.groups) { group in
                        Section(header: Text(group.header ?? ""), footer: Text(group.footer ?? "")) {
                            ForEach(group.settings) { item in
                                Text(item.title)
                            }
                        }
                    }
                }
                .navigationBarTitle("Settings")
                .listStyle(GroupedListStyle())
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static let demoStore = Store(initialState: AppState(myAlbums: CannedData.albums, showSettings: false, settings: SettingsPageBuilder.build(version: "1.0.4 (453)")),
                                 reducer: AppReducer().main,
                                 environment: AppEnvironment(mainQueue: DispatchQueue.main.eraseToAnyScheduler(), appVersion: "4.6.4", authenticationToken: ""))

    static var previews: some View {
        Group {
            SettingsView(store: demoStore)
            SettingsView(store: demoStore)
                .colorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}
