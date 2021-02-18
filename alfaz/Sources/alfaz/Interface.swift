//
import Combine
import Foundation

public struct Alfaz {

//    public var searchLocations: (CLLocationCoordinate2D) -> AnyPublisher<[Location], Error>
//    public var weather: (Int) -> AnyPublisher<WeatherResponse, Error>

    public var topArtists: () -> AnyPublisher<PagingResponse, Error>

    public init(topArtists: @escaping () -> AnyPublisher<PagingResponse, Error>) {
        self.topArtists = topArtists
    }
}

public struct PagingResponse: Decodable {
    var items: [ArtistResponse]
//    let limit: Int
//    let offset: Int
//    let total: Int
//    let next: String
//    let previous: String
}

public struct ArtistResponse: Codable {
    let id: String
    let name: String
}
