//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

struct Artist: Identifiable, Equatable, Decodable {
    let id: String
    let type: String
    let name: String
    let spotifyUri: String

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case name
        case spotifyUri = "uri"
    }
}
