//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Combine
import Foundation

extension Alfaz {

    public static let empty = Self(
        topArtists: {
            Just(PagingResponse(items: []))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        })

    public static let error = Self(
        topArtists: {
            Fail(error: NSError(domain: "", code: 1, userInfo: nil))
                .eraseToAnyPublisher()
        })

    public static let happyPath = Self(
        topArtists: {
            Just(
                PagingResponse(
                    items: [
                        ArtistResponse(id: "sdfdsfsdfdsfsdfsdf", name: "Pinnk Floyd"),
                        ArtistResponse(id: "sdfsdfsfas", name: "Mão Morta"),
                        ArtistResponse(id: "xfewrterg", name: "The Cure")
                    ]
                )
            )
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
        })
}
