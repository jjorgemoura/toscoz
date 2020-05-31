//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

struct SettingsGroup: Equatable {
    let header: String?
    let footer: String?
    let settings: [Setting]
}

struct SettingsPageBuilder {

    static func build(version: String) -> SettingsPage {
//        let version = "Version: 0.6.0"

        let setting11 = Setting(title: "XPTO", body: nil, linkPage: nil, type: .page)

        let settingX = Setting(title: "xxx", body: "", linkPage: nil, type: .statement)
        let settingY = Setting(title: "yyy", body: "", linkPage: nil, type: .statement)
        let settingZ = Setting(title: "zzz", body: "", linkPage: nil, type: .statement)

        let linkPage1 = SettingsPage(type: .detail, groups: [SettingsGroup(header: nil, footer: nil, settings: [settingX])])
        let linkPage2 = SettingsPage(type: .detail, groups: [SettingsGroup(header: nil, footer: nil, settings: [settingY])])
        let linkPage3 = SettingsPage(type: .detail, groups: [SettingsGroup(header: nil, footer: nil, settings: [settingZ])])

        let setting21 = Setting(title: "Third-Party", body: nil, linkPage: linkPage1, type: .page)
        let setting22 = Setting(title: "Privacy Policy", body: nil, linkPage: linkPage2, type: .page)
        let setting23 = Setting(title: "About", body: nil, linkPage: linkPage3, type: .page)

        let appGroup = SettingsGroup(header: nil, footer: nil, settings: [setting11])
        let aboutGroup = SettingsGroup(header: nil, footer: version, settings: [setting21, setting22, setting23])

        return SettingsPage(type: .topLevel, groups: [appGroup, aboutGroup])
    }
}
