//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

struct Album: Identifiable, Equatable, Decodable {
    let id: String
    let type: String
    let name: String
    let artists: [Artist]
    let albumType: String
    let popularity: Int

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case name
        case artists
        case albumType = "album_type"
        case popularity
    }
}
