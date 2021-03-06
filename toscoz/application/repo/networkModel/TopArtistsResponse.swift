//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation

struct TopArtistsResponse: Decodable, Equatable {
    let items: [ArtistResponse]

    func toModel() -> [Artist] {
        return items.map { $0.toModel() }
    }
}

struct ArtistResponse: Decodable, Equatable {
    let id: String
    let genres: [String]
    let href: String
    let images: [ImageResponse]
    let name: String
    let popularity: Int
    let uri: String

    func toModel() -> Artist {
        return Artist(identifier: id,
                      name: name,
                      popularity: popularity,
                      images: images.map { $0.toModel() },
                      genres: genres,
                      href: href,
                      uri: uri)
    }
}

struct ImageResponse: Decodable, Equatable {
    let url: String
    let height: Int?
    let width: Int?

    func toModel() -> Image {
        let dimension: ImageDimension?
        if let width = width, let height = height {
            dimension = ImageDimension(width: width, height: height)
        } else {
            dimension = nil
        }
        return Image(url: url, dimension: dimension)
    }
}
