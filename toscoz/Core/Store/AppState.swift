//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

struct AppState: Equatable {
    var myAlbums: [Album] = []

    var showSettings: Bool = false
    var settings: SettingsPage
}
