//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

struct Album: Identifiable, Equatable, Decodable {
    let id: String
    let name: String
    let artist: [Artist]
    let popularity: Int
}
