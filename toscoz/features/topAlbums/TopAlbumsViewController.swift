//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

class TopAlbumsViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .plain)
    private let viewModel: TopAlbumsViewModel
    private let eventHandler: EventHandler

    init(viewModel: TopAlbumsViewModel, eventHandler: EventHandler) {
        self.viewModel = viewModel
        self.eventHandler = eventHandler

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        tableView.register(TopAlbumsTableViewCell.self, forCellReuseIdentifier: TopAlbumsTableViewCell.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension

        view.addSubview(tableView)
        tableView.bindToSuperView()

        eventHandler.post(event: TopAlbumsPresented())
    }
}

extension TopAlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TopAlbumsTableViewCell.cellIdentifier, for: indexPath) as? TopAlbumsTableViewCell {
            let album = viewModel.items[indexPath.row]

            cell.configure(album: album)
            return cell
        }
        fatalError("This should not happen")
    }
}

extension TopAlbumsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumSelected = viewModel.items[indexPath.row]

        eventHandler.post(event: TopAlbumsTapped(albumId: albumSelected))
    }
}

extension UIView {
    func bindToSuperView() {
        guard let superView = self.superview else { return }

        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: superView.topAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: 0).isActive = true
    }
}
