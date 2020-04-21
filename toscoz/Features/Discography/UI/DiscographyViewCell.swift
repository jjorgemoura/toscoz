//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import UIKit

class DiscographyViewCell: UITableViewCell {

    static let cellIdentifier = "DiscographyViewCell"

    @IBOutlet private var titleLabel: UILabel?
    @IBOutlet private var artistLabel: UILabel?

    func configure(viewModel: Discography) {
        backgroundColor = .cyan
        titleLabel?.text = viewModel.title
        artistLabel?.text = viewModel.artist

        titleLabel?.style(as: .title)
    }
}
