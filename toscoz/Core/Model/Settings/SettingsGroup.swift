//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

struct SettingsGroup: Equatable, Identifiable {
    let id: UUID
    let header: String?
    let footer: String?
    let settings: [Setting]
}
