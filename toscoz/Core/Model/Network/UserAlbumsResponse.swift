//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

struct UserAlbumsResponse: Equatable, Decodable {

    let items: [SavedAlbumResponse]

    let href: String
    let limit: Int
    let offset: Int

    let next: String?
    let previous: String?

    let total: Int
}
