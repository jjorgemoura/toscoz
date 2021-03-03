//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

class TopArtistsTableViewCell: UITableViewCell {

    static let cellIdentifier = "TopArtistsTableViewCell"

    private let titleLabel = UILabel()
    private let popularityLabel = UILabel()
    private let mainStackView = UIStackView()

    func configure(album: String, popularity: String) {
        titleLabel.text = album
        titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        titleLabel.textColor = .systemGray

        popularityLabel.text = popularity
        popularityLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        popularityLabel.textColor = .systemRed

        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(popularityLabel)
        mainStackView.axis = .vertical

        contentView.addSubview(mainStackView)

        mainStackView.bindToSuperView(with: 16)
    }
}
