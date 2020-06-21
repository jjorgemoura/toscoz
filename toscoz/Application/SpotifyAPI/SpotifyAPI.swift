//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

typealias SpotifyToken = String

enum SpotifyApi: String {
    case authorization = "https://accounts.spotify.com/authorize?client_id=99999999999999999999999&response_type=token&redirect_uri=toscoz://callback/&state=123&scope=user-library-read,playlist-read-private,playlist-read-collaborative,user-follow-read"
    case myAlbums = "https://api.spotify.com/v1/me/albums"

    //    case myAlbums(limit: Int)

//    func build() -> URL {
//        let xpto: String
//
//        switch self {
//        case .authorization(let spotifyToken):
//            xpto = ""
//        case .myAlbums(let limit):
//            xpto = ""
//        }
//
//        return URL(string: xpto)!
//    }

    func appendToken() {
    }
}
