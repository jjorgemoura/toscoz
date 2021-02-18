//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import SwiftUI

enum PaletteColor: String {
    case ceriseWfrenchRose
    case chilli
    case deninWceruleanBlue
    case ebonWrhino
    case unitedNationsBlueWblueCrayola
    case vividBurgundyWamaranthPurple
}

// MARK: App
extension Color {
    // MARK: - Primary and secondary colors and variants

    static var appPrimary: Color {
        return Color(.ceriseWfrenchRose)
    }

    static var appPrimaryVariant: Color {
        return Color(.vividBurgundyWamaranthPurple)
    }

    static var appSecondary: Color {
        return Color(.unitedNationsBlueWblueCrayola)
    }

    static var appSecondaryVariant: Color {
        return Color(.deninWceruleanBlue)
    }

    // MARK: - Additinal colors

    static var appBackground: Color {
        return Color(.systemBackground)
    }

    static var appSurface: Color {
        return Color(.secondarySystemBackground)
    }

    static var appError: Color {
        return Color(.chilli)
    }

    // MARK: - Typography colors

    static var appOnPrimary: Color {
        return Color(.ebonWrhino)
    }

    static var appOnSecondary: Color {
        return Color(.ebonWrhino)
    }

    static var appOnBackground: Color {
        return Color(.label)
    }

    static var appOnSurface: Color {
        return Color(.secondaryLabel)
    }

    static var appOnError: Color {
        return Color(.ebonWrhino)
    }
}
