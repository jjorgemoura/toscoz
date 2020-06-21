//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

@testable import toscoz
import Foundation

struct FakeLocalPersistenceStore {
    @UserDefault(key: "test1", defaultValue: nil, store: UserDefaults(suiteName: "testStore")) var test1: String?
    @UserDefault(key: "test2", defaultValue: "test2DefaultValue", store: UserDefaults(suiteName: "testStore")) var test2: String
    @UserDefault(key: "test3", defaultValue: 5, store: UserDefaults(suiteName: "testStore")) var test3: Int
    @UserDefault(key: "test4", defaultValue: nil, store: UserDefaults(suiteName: "testStore")) var test4: Int?
}
