//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

struct Setting: Equatable {
    let title: String
    let body: String?
    let linkPage: SettingsPage?
    let type: SettingType
}
