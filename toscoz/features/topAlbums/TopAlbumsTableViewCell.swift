//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

class TopAlbumsTableViewCell: UITableViewCell {

    static let cellIdentifier = "TopAlbumsTableViewCell"

    private let albumLabel = UILabel()

    func configure(album: String) {
        albumLabel.text = album

        contentView.addSubview(albumLabel)

        albumLabel.bindToSuperView()
    }
}
