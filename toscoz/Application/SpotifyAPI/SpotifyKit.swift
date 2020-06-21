//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

struct SpotifyKit {

    static let spotifyKey: String? = "11111111"
    static let spotifyTokenExpirationSeconds: Double = 3600

    func isTokenValid(tokenTimestamp timestamp1970: TimeInterval) -> Bool {

        return Date().timeIntervalSince1970 < timestamp1970.advanced(by: SpotifyKit.spotifyTokenExpirationSeconds)
    }
}
