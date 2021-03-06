//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Combine
import Foundation

struct TopArtistsRepo {
    var topArtists: (String) -> AnyPublisher<TopArtistsResponse, Error>
}

extension TopArtistsRepo {
    static var live = Self(
        topArtists: { token in
            guard let url = URL(string: "https://api.spotify.com/v1/me/top/artists") else { fatalError("Devs error") }

            var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .map { data, response in
                    print(data)
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
                ArtistResponse(id: "Frances the Mute", genres: ["prog"], href: "", images: [], name: "The Mars Volta", popularity: 80, uri: ""),
                ArtistResponse(id: "B Fachada II", genres: ["tuga"], href: "", images: [], name: "B Fachada", popularity: 51, uri: ""),
                ArtistResponse(id: "Os Homens nao se querem bonitos", genres: ["pop rock"], href: "", images: [], name: "GNR", popularity: 55, uri: ""),
                ArtistResponse(id: "The Top", genres: ["new wave"], href: "", images: [], name: "The Cure", popularity: 89, uri: "")
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
