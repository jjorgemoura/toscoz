//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation
import ComposableArchitecture

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    print(environment)

    switch action {
    case .loadTopArtists:

        let xpto = environment.networkClient.topArtists()
//        let merda = xpto.map { pubs in AppAction.topArtistsLoaded([]) } //.mapError { _ in Failure.}




    case .topArtistsLoaded(let artists):
        print(artists)
        return .none
    }
}
.debug()
