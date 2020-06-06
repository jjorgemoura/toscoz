//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct Famelz {}

struct Response {}

struct FamelzResource {}

struct FamelzBackendRegistry {}

struct FamelzEndpointPath {}

struct NetworkFailure: Error, Equatable {}

struct SpotifyClient {
    var authorize: () -> Effect<String, NetworkFailure>
    var myAlbums: (String) -> Effect<[Album], NetworkFailure>
}

extension SpotifyClient {
    static let live = SpotifyClient(
        authorize: {
            var components = URLComponents(string: "https://accounts.spotify.com/authorize?client_id=fe5d97ca82f749d38c331875d26c6e18&response_type=token&redirect_uri=toscoz://granted&state=123")!

            return URLSession.shared.dataTaskPublisher(for: components.url!)
                .map { data, _ in
                    print(String(data: data, encoding: .utf8))
                    return data
            }
            .decode(type: String.self, decoder: Decoder().json)
            .mapError { error in print(error); return NetworkFailure() }
            .eraseToEffect()
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
