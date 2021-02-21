//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Combine
import Foundation
import UIKit

struct AuthenticationRepo {
    var authenticate: () -> Void
}

// swiftlint:disable line_length
extension AuthenticationRepo {
    static var live: Self {
        let authEndpoint = "https://accounts.spotify.com/authorize?client_id=XXXXX&response_type=token&redirect_uri=toscoz://callback/&state=123&scope=user-library-read,playlist-read-private,playlist-read-collaborative,user-follow-read"
        let url = URL(string: authEndpoint)

        return Self {
            guard let url = url else { return }

            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension AuthenticationRepo {
    static let mock = Self { }
}
