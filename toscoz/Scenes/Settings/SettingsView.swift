//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct SettingsView: View {

    let store: Store<AppState, AppAction>

    var body: some View {

        WithViewStore(self.store) { viewState in

//            Text("sdsd")
            Text("sadzssa -> \(viewState.settings.type.rawValue)")

//            List(asdasd.groups) { group in
//
//                Text("sdf sdfsdf sdfsdfsfd")
//            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
//        Group {
//            AlbumView()
//        }
        Text("sd")
    }
}
