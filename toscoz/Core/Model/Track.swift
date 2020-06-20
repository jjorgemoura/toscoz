//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

struct Track: Equatable, Decodable {
    let identifier: String
    let name: String
    let trackNumber: Int
    let duration: Int
}
