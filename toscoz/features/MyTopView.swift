//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation
import SwiftUI
import ComposableArchitecture

struct MyTopView: View {
    let store: Store<AppState, AppAction>

    var body: some View {

        WithViewStore(self.store) { viewStore in
            NavigationView {
                List(viewStore.topArtists) { artist in
                    Text(artist.name)
                }
                .navigationBarTitle("Top Albums")
                .navigationBarItems(trailing: Button(action: {},
                                                     label: { Image(systemName: "gear") })
                )
            }
            //            .onAppear { viewStore.send(.loadMyAlbums) }
        }
    }
}

struct MyTopView_Previews: PreviewProvider {

    static var previews: some View {
        let demoStore = Store(initialState: AppState(topArtists: []),
                              reducer: appReducer,
                              environment: AppEnvironment(networkClient: .happyPath))

        Group {
            MyTopView(store: demoStore)
            MyTopView(store: demoStore)
                .colorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}
