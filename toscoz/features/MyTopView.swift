//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation
import SwiftUI
// import ComposableArchitecture

struct MyTopView: View {

//    let store: Store<AppState, AppAction>

    var body: some View {

        Text("asdkasdhkashkdahsd")

//        WithViewStore(self.store) { viewStore in
//
//            NavigationView {
//                List(viewStore.myAlbums) { album in
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text(album.name)
//                            Text(album.artists[0].name)
//                                .font(.caption)
//                        }
//                    }
//                }
//                .navigationBarTitle("My Albums")
//                .navigationBarItems(trailing:
//                                        Button(action: {}, label: { Image(systemName: "gear") })
//                )
//            }
//            .onAppear { viewStore.send(.loadMyAlbums) }
//        }
    }
}

struct MyTopView_Previews: PreviewProvider {

//    static let demoStore = Store(initialState: AppState(myAlbums: CannedData.albums, showSettings: false, settings: SettingsPageBuilder.build(version: "")),
//                                 reducer: AppReducer().main,
//                                 environment: AppEnvironment(mainQueue: DispatchQueue.main.eraseToAnyScheduler(), appVersion: "4.6.4", authenticationToken: ""))

    static var previews: some View {
        Group {
            MyTopView()
            MyTopView()
                .colorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}
