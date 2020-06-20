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
    var myAlbums: (String) -> Effect<[Album], NetworkFailure>
}

extension SpotifyClient {
    static let live = SpotifyClient(
        authorize: {
//            var components = URLComponents(string: "https://accounts.spotify.com/authorize?client_id=1111111111111111111&response_type=token&redirect_uri=toscoz://granted&state=123")!

//            return URLSession.shared.dataTaskPublisher(for: components.url!)
//                .map { data, _ in
//                    print(String(data: data, encoding: .utf8))
//                    return data
//            }
//            .decode(type: String.self, decoder: Decoder().json)
//            .mapError { error in print(error); return NetworkFailure() }
//            .eraseToEffect()
//

            let authUrl = "https://accounts.spotify.com/authorize?client_id=1111111111111111111&response_type=token&redirect_uri=toscoz://callback/&state=123&scope=user-read-private"
            let url = URL(string: authUrl)!

            UIApplication.shared.open(url)

            return
        },
        myAlbums: { query in
            print(print)
            var components = URLComponents(string: "https://api.spotify.com/v1/me/albums")!
//            components.queryItems = [URLQueryItem(name: "query", value: query)]

            return URLSession.shared.dataTaskPublisher(for: components.url!)
                .map { data, _ in
                    print(String(data: data, encoding: .utf8))
                    return data
                }
                .decode(type: [Album].self, decoder: Decoder().json)
                .mapError { error in print(error); return NetworkFailure() }
                .eraseToEffect()
        }
    )
}
