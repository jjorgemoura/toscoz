//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

enum PaletteColor: String {
    case chalkW
    case deepGreenW
    case ravenW
    case spotifyW
    case verisonWchilli
    case vividRedW
    case wolfW
}

extension UIColor {
    convenience init(_ color: PaletteColor) {
        self.init(named: color.rawValue)!
    }

    func debugValue() -> String {
        self.description
    }
}

// MARK: App
extension UIColor {
    // MARK: - Primary and secondary colors and variants

    static var appPrimary: UIColor {
        return UIColor(.spotifyW)
    }

    static var appPrimaryVariant: UIColor {
        return UIColor(.deepGreenW)
    }

    static var appSecondary: UIColor {
        return UIColor(.vividRedW)
    }

    // MARK: - Additinal colors

    static var appBackground: UIColor {
        return .systemBackground
    }

//    static var appSurface: UIColor {
//        return .secondarySystemBackground
//    }

    static var appDivider: UIColor {
        return UIColor(.wolfW)
    }

    static var appError: UIColor {
        return UIColor(.verisonWchilli)
    }

    // MARK: - Typography colors

    static var appPrimaryText: UIColor {
        return .label
    }

    static var appSecondaryText: UIColor {
        return .secondaryLabel
    }

    static var appTextOnPrimary: UIColor {
        return UIColor(.ravenW)
    }

    static var appTextOnSecondary: UIColor {
        return UIColor(.ravenW)
    }

    static var appTextOnError: UIColor {
        return UIColor(.ravenW)
    }
}
