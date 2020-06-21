//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import UIKit
import ComposableArchitecture

struct Famelz {}

struct Response {}

struct FamelzResource {}

struct FamelzBackendRegistry {}

struct FamelzEndpointPath {}

struct NetworkFailure: Error, Equatable {}

struct SpotifyClient {
    var authorize: () -> Void
    var myAlbums: (String) -> Effect<UserAlbumsResponse, NetworkFailure>
}

extension SpotifyClient {
    static let live = SpotifyClient(
        authorize: {
            let authUrl = SpotifyApi.authorization.rawValue

            if let url = URL(string: authUrl) {
                UIApplication.shared.open(url)
            }
            return
        },
        myAlbums: { query in

            let apiUrl = SpotifyApi.myAlbums.rawValue

            guard let url = URL(string: apiUrl) else { fatalError("hgmfg") }

            var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)

            let accessToken = LocalPersistenceStore().spotifyToken ?? ""
            urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

            return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .map { data, _ in return data
                }
                .decode(type: UserAlbumsResponse.self, decoder: Decoder().json)
                .mapError { error in print(error); return NetworkFailure() }
                .eraseToEffect()
        }
    )
}
