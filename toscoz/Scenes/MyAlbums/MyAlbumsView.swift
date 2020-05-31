//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct MyAlbumsView: View {

    let store: Store<AppState, AppAction>

    var body: some View {

        WithViewStore(self.store) { viewState in

            List(viewState.myAlbums) { album in
                HStack {
                    VStack(alignment: .leading) {
                        Text(album.name)
                        Text(album.artist[0].name)
                            .font(.caption)
                    }
                }
            }
        .navigationBarTitle("My Albums")
        .navigationBarItems(trailing:
            Button(action: {}, label: { Image(systemName: "gear") })
            )

//            NavigationView {
//                VStack {
//                    Text("London")
//                    Text("Next Hour")
//                    Text("Sunny and moderate breeze")
//                }
//                .navigationBarTitle(
//                    Text(""),
//                    displayMode: .inline
//                )
//                    .navigationBarItems(
//                        trailing:
//                        HStack {
//                            Button(action: {}) {
//                                Image(systemName: "magnifyingglass")
//                            }
//                            .foregroundColor(.blue)
//                        }
//                )
//            }
//            .navigationViewStyle(DefaultNavigationViewStyle())
        }
    }
}

struct MyAlbumsView_Previews: PreviewProvider {

    static let demoStore = Store(initialState: AppState(showSettings: false, myAlbums: CannedData.albums, settings: SettingsPageBuilder.build(version: "")),
                                 reducer: AppReducer().main,
                                 environment: AppEnvironment(appVersion: "4.6.4"))

    static var previews: some View {
        Group {
            MyAlbumsView(store: demoStore)
            MyAlbumsView(store: demoStore)
                .colorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}
