//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation

struct Artist {
    let identifier: String
    let name: String
    let popularity: Int
    let images: [Image]
    let genres: [String]
    let href: String
    let uri: String

    func smallerImage() -> Image {
        return images[images.count - 1]
    }
}
