//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

extension UIFont {
    static func preferredFont(for style: TextStyle, weight: Weight) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: style)
        let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
        let font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)
        return metrics.scaledFont(for: font)
    }
}

extension UIFont {
    static var appContentSectionHeader: UIFont {
        return UIFont.preferredFont(forTextStyle: .headline) // was bold
    }

    static var appContentSectionFooter: UIFont {
        return UIFont.preferredFont(forTextStyle: .footnote) // was semibold
    }

    static var appContentItemTitle: UIFont {
        return UIFont.preferredFont(forTextStyle: .callout) // was medium
    }

    static var appContentItemSubtitle: UIFont {
        return UIFont.preferredFont(forTextStyle: .subheadline)
    }

    static var appActionButton: UIFont {
        return UIFont.preferredFont(forTextStyle: .headline)
    }

    static var appMessageTitle: UIFont {
        return UIFont.preferredFont(forTextStyle: .headline)
    }

    static var appMessage: UIFont {
        return UIFont.preferredFont(forTextStyle: .body)
    }
}
