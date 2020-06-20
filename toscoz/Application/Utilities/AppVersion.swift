//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import Foundation

enum AppVersion {
    private static let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "?.?.?"
    private static let versionBuild = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "?"

    static let appVersion = "Version: \(versionNumber) (\(versionBuild))"
}
