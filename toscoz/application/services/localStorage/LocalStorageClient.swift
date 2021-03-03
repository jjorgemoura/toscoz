//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation

struct LocalStorageClient {
    var read: (LocalStorageKey) -> Data?
    var write: (Data, LocalStorageKey) -> Void
}

extension LocalStorageClient {

    static var mock = Self(
        read: { _ in return nil },
        write: { _, _ in })

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
}
