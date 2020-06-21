//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

struct LocalPersistenceStore {
    @UserDefault(key: "spotifyToken", defaultValue: nil) var spotifyToken: String?
    @UserDefault(key: "spotifyTokenTimestamp", defaultValue: 0) var spotifyTokenTimestamp: TimeInterval
}

@propertyWrapper
struct UserDefault<T> {

    private var key: String
    private var defaultValue: T
    private var store: UserDefaults

    var wrappedValue: T {
        get { return store.value(forKey: key) as? T ?? defaultValue }
        set {
            if let optional = newValue as? AnyOptional, optional.isNil {
                store.removeObject(forKey: key)
            } else {
                store.set(newValue, forKey: key)
            }
        }
    }

    init(key: String, defaultValue: T, store: UserDefaults? = UserDefaults.standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.store = store ?? UserDefaults.standard
    }
}
