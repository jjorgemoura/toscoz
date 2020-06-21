//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

struct SavedAlbumResponse: Equatable, Decodable {
    let addedAt: String
    let album: Album

    enum CodingKeys: String, CodingKey {
        case addedAt = "added_at"
        case album
    }
}
