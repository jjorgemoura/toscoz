//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation

struct Authentication: Codable {
    let token: String
    let expireAt: Date
}
