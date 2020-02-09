//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import UIKit

class MyAlbumsViewCell: UITableViewCell {

    static let cellIdentifier = "MyAlbumsViewCell"

    @IBOutlet private var titleLabel: UILabel?
    @IBOutlet private var artistLabel: UILabel?

    func configure(viewModel: Discography) {
        backgroundColor = .cyan
        titleLabel?.text = viewModel.title
        artistLabel?.text = viewModel.artist

        titleLabel?.style(as: .title)
    }
}
