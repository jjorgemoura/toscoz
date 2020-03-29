//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

enum SpotifyApiResources {
    case discography(limit: Int)
}

struct SpotifyAPI {

    static func api(for: SpotifyApiResources) -> String {

        "https://api.spotify.com/v1/albums"
    }
}
