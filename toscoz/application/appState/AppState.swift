//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

struct AppState {
    let authentication: Authentication?
    let topAlbums: [Album]
}

extension AppState {
    static var initialState = Self(authentication: nil, topAlbums: [])
}
