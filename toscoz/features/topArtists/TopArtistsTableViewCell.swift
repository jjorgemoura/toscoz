//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

class TopArtistsTableViewCell: UITableViewCell {

    static let cellIdentifier = "TopArtistsTableViewCell"

    private let albumLabel = UILabel()

    func configure(album: String) {
        albumLabel.text = album

        contentView.addSubview(albumLabel)

        albumLabel.bindToSuperView()
    }
}
