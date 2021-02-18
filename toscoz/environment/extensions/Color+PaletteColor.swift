//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import SwiftUI

extension Color {
    init(_ color: PaletteColor) {
        self.init(color.rawValue)
    }

    func debugValue() -> String {
        self.description
    }
}
