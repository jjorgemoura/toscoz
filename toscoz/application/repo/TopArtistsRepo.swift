//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Combine
import Foundation

struct TopArtistsRepo {
    var topArtists: (String) -> AnyPublisher<TopArtistsResponse, Error>
}

struct TopArtistsResponse: Decodable, Equatable {
    let items: [ArtistResponse]

    func toModel() -> [Artist] {
        return items.map { $0.toModel() }
    }
}

struct ArtistResponse: Decodable, Equatable {
    let id: String
    let name: String

    func toModel() -> Artist {
        return Artist(identifier: id, name: name)
    }
}

extension TopArtistsRepo {
    static var live = Self(
        topArtists: { token in
            guard let url = URL(string: "https://api.spotify.com/v1/me/top/artists") else { fatalError("Devs error") }

            var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .map { data, response in data
                    print(response)
                    return data
                }
                .mapError({ error -> Error in
                    print(error)
                    return error
                })
                .decode(type: TopArtistsResponse.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        })
}

extension TopArtistsRepo {
    static let empty = Self(
        topArtists: { _ in
            Just(TopArtistsResponse(items: []))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        })

    static let happyPath = Self(
        topArtists: { _ in
            Just(TopArtistsResponse(items: [
                ArtistResponse(id: "Frances the Mute", name: "The Mars Volta"),
                ArtistResponse(id: "B Fachada II", name: "B Fachada"),
                ArtistResponse(id: "Os Homens nao se querem bonitos", name: "GNR"),
                ArtistResponse(id: "The Top", name: "The Cure")
            ]))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        })

    static let failed = Self(
        topArtists: { _ in
            Fail(error: NSError(domain: "", code: 1))
                .eraseToAnyPublisher()
        })
}
