//
//  Copyright © 2020 Jorge Moura. All rights reserved.
//

import UIKit

class Typography {

    func style(element: UILabel) {
        element.font = UIFont.preferredFont(forTextStyle: .headline)
        element.textColor = .systemGreen
//        element.font.
    }
}

enum TypographyTextStyle {
    case title
    case body
    case body2

    func color() -> UIColor {
        switch self {
        case .title: return .gray
        case .body: return .red
        case .body2: return .green
        }
    }

//    case .title1: return font(name: .regularFontName, size: 28.0, style: textStyle)
//    case .title2: return font(name: .mediumFontName, size: 20.0, style: textStyle)
//    case .title3: return font(name: .regularFontName, size: 19.0, style: textStyle)
//    case .headline: return font(name: .mediumFontName, size: 17.0, style: textStyle)
//    case .body: return font(name: .regularFontName, size: 17.0, style: textStyle)
//    case .callout: return font(name: .regularFontName, size: 15.0, style: textStyle)
//    case .subheadline: return font(name: .mediumFontName, size: 14.0, style: textStyle)
//    case .footnote: return font(name: .regularFontName, size: 13.0, style: textStyle)
//    case .caption1: return font(name: .regularFontName, size: 12.0, style: textStyle)
//    case .caption2: return font(name: .regularFontName, size: 11.0, style: textStyle)
}

extension UILabel {
    func style(as type: TypographyTextStyle) {
        self.font = UIFont.preferredFont(forTextStyle: .headline)
        self.textColor = .green
    }
}
