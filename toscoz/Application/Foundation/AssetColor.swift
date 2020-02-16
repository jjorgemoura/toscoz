//
//  Copyright © 2020 Jorge Moura. All rights reserved.
//

import UIKit

struct AssetColor {
    private let assetColor: UIColor?

    var color: UIColor {
        guard let assetColor = assetColor else { preconditionFailure("Attemp to load a color from Color Assets with an invalid name!!!") }

        return assetColor
    }

    init(assetName: String) {
        assetColor = UIColor(named: assetName)
    }
}
