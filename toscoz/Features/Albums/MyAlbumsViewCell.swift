//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import UIKit

class MyAlbumsViewCell: UITableViewCell {

    static let cellIdentifier = "MyAlbumsViewCell"

    @IBOutlet private var titleLabel: UILabel?
    @IBOutlet private var artistLabel: UILabel?

    func configure(viewModel: String) {
        backgroundColor = .cyan
        titleLabel?.text = viewModel
        artistLabel?.text = "Pink Floyd"
    }
}
