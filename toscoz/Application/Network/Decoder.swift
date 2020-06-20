//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

struct Decoder {
    let json: JSONDecoder = {
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_UK")

        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }()
}
