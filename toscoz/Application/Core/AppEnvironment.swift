//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct AppEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var appVersion: String
}
