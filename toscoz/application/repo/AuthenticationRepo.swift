//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Combine
import Foundation
import UIKit

struct AuthenticationRepo {
    var authenticate: () -> Void
}

extension AuthenticationRepo {
    static var live: Self {

        let scopes: [String] = [
            "user-top-read",
            "playlist-read-private",
            "playlist-read-collaborative",
            "user-follow-read"
        ]

        let allScopes = scopes.reduce(into: "") { result, scope in
            if result.isEmpty {
                result = scope
            }
            result += "," + scope
        }

        let queryItems: [String: String] = [
            "client_id": SpotifyConfig.clientId,
            "response_type": "token",
            "redirect_uri": "toscoz://callback/",
            "state": "123",
            "scope": allScopes
        ]

        guard var url = URL(string: "https://accounts.spotify.com") else { fatalError("Devs error") }
        url.appendPathComponent("authorize")

        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = queryItems.map { key, value in
            return URLQueryItem(name: key, value: value)
        }

        return Self {
            guard let url = urlComponents?.url else { return }

            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension AuthenticationRepo {
    static let mock = Self { }
}
