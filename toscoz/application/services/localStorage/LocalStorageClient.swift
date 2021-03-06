//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation

struct LocalStorageClient {
    var read: (LocalStorageKey) -> Data?
    var write: (Data, LocalStorageKey) -> Void
}

// swiftlint:disable line_length
extension LocalStorageClient {

    static var live: Self {
        let userDefaults = UserDefaults.standard

        return Self(
            read: { key in
                print("JM: PRINT USERDEFAULTS -> read -> \(key)")
                return userDefaults.data(forKey: key)
            },
            write: { data, key in
                print("JM: PRINT USERDEFAULTS -> WRITE -> \(key)")
                userDefaults.setValue(data, forKey: key)
            }
        )
    }

    static var mock = Self(
        read: { _ in
            let mockAuth = Authentication(token: "BQCuLVfssRoPBNoSF98A1wOej2ng3KTT-xhLkNtC-2Pz8jEhRiiOFZ8PIzG5MYH626SUA5oDc1LRQV3Xyk1gsa9FgiiWpFfaFlt4ezCRRglQVHPrEAcHN306xEKLE_ruOe757RqZ_1fFPMCadoUS148HuSbZ2w8L4Mle5PxKsM05E9Ehb-0PqXqYLCN18ciW",
                                          expireAt: Date(timeInterval: SpotifyConfig.tokenLifetimeSeconds, since: Date())
            )

            let authenticationData = try? JSONEncoder().encode(mockAuth)
            return authenticationData
        },
        write: { _, _ in })
}
