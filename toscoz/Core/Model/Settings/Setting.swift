//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

struct Setting: Equatable, Identifiable {
    var id: UUID
    let title: String
    let body: String?
    let linkPage: SettingsPage?
    let type: SettingType
}
