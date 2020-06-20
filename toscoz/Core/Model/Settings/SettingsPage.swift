//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

struct SettingsPage: Equatable {
    let type: SettingsPageType
    let groups: [SettingsGroup]
}

struct SettingsPageBuilder {

    static func build(version: String) -> SettingsPage {
        let setting11 = Setting(id: UUID(), title: "XPTO", body: nil, linkPage: nil, type: .page)

        let settingX = Setting(id: UUID(), title: "xxx", body: "", linkPage: nil, type: .statement)
        let settingY = Setting(id: UUID(), title: "yyy", body: "", linkPage: nil, type: .statement)
        let settingZ = Setting(id: UUID(), title: "zzz", body: "", linkPage: nil, type: .statement)

        let linkPage1 = SettingsPage(type: .detail, groups: [SettingsGroup(id: UUID(), header: nil, footer: nil, settings: [settingX])])
        let linkPage2 = SettingsPage(type: .detail, groups: [SettingsGroup(id: UUID(), header: nil, footer: nil, settings: [settingY])])
        let linkPage3 = SettingsPage(type: .detail, groups: [SettingsGroup(id: UUID(), header: nil, footer: nil, settings: [settingZ])])

        let setting21 = Setting(id: UUID(), title: "Third-Party", body: nil, linkPage: linkPage1, type: .page)
        let setting22 = Setting(id: UUID(), title: "Privacy Policy", body: nil, linkPage: linkPage2, type: .page)
        let setting23 = Setting(id: UUID(), title: "About", body: nil, linkPage: linkPage3, type: .page)

        let appGroup = SettingsGroup(id: UUID(), header: nil, footer: nil, settings: [setting11])
        let aboutGroup = SettingsGroup(id: UUID(), header: nil, footer: version, settings: [setting21, setting22, setting23])

        return SettingsPage(type: .topLevel, groups: [appGroup, aboutGroup])
    }
}
