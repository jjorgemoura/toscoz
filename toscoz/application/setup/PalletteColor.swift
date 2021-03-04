//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

enum PaletteColor: String {
    case ceriseWfrenchRose
    case chilli
    case deninWceruleanBlue
    case ebonWrhino
    case unitedNationsBlueWblueCrayola
    case vividBurgundyWamaranthPurple
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
        return UIColor(.ceriseWfrenchRose)
    }

    static var appPrimaryVariant: UIColor {
        return UIColor(.vividBurgundyWamaranthPurple)
    }

    static var appSecondary: UIColor {
        return UIColor(.unitedNationsBlueWblueCrayola)
    }

    static var appSecondaryVariant: UIColor {
        return UIColor(.deninWceruleanBlue)
    }

    // MARK: - Additinal colors

    static var appBackground: UIColor {
        return .systemBackground
    }

    static var appSurface: UIColor {
        return .secondarySystemBackground
    }

    static var appError: UIColor {
        return UIColor(.chilli)
    }

    // MARK: - Typography colors

    static var appOnPrimary: UIColor {
        return UIColor(.ebonWrhino)
    }

    static var appOnSecondary: UIColor {
        return UIColor(.ebonWrhino)
    }

    static var appOnBackground: UIColor {
        return .label
    }

    static var appOnSurface: UIColor {
        return .secondaryLabel
    }

    static var appOnError: UIColor {
        return UIColor(.ebonWrhino)
    }
}
