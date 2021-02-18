//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import alfaz
import Combine
import Foundation

extension Alfaz {
    public static let live = Self(topArtists: {
        let request = URLRequest(url: URL(string: "https://api.spotify.com/v1/me/top/artists")!)

        return URLSession.shared.dataTaskPublisher(for: request)
            .map { data, _ in data }
            .decode(type: PagingResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    })
}

//private let weatherJsonDecoder: JSONDecoder = {
//    let jsonDecoder = JSONDecoder()
//    let formatter = DateFormatter()
//    formatter.dateFormat = "yyyy-MM-dd"
//    jsonDecoder.dateDecodingStrategy = .formatted(formatter)
//    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//    return jsonDecoder
//}()
