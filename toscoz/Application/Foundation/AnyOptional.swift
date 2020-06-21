//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    var isNil: Bool { self == nil }
}
