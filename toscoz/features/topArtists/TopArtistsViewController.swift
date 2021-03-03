//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import UIKit

class TopArtistsViewController: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let viewModel: TopArtistsViewModel
    private let eventHandler: EventHandler

    init(viewModel: TopArtistsViewModel, eventHandler: EventHandler) {
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
        tableView.register(TopArtistsTableViewCell.self, forCellReuseIdentifier: TopArtistsTableViewCell.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension

        view.addSubview(tableView)
        tableView.bindToSuperView()

        viewModel.dataDidLoad = { [weak self] in self?.tableView.reloadData() }

        eventHandler.post(event: TopArtistsPresented())
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.refresh()
    }
}

extension TopArtistsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TopArtistsTableViewCell.cellIdentifier, for: indexPath) as? TopArtistsTableViewCell {
            let artist = viewModel.items[indexPath.row]

            cell.configure(album: artist.name, popularity: String(artist.popularity))
            return cell
        }
        fatalError("This should not happen")
    }
}

extension TopArtistsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumSelected = viewModel.items[indexPath.row]

        eventHandler.post(event: TopArtistsTapped(albumId: albumSelected.identifier))
    }
}

extension UIView {
    func bindToSuperView() {
        bindToSuperView(with: 0)
    }

    func bindToSuperView(with marging: CGFloat) {
        guard let superView = self.superview else { return }

        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: marging).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -marging).isActive = true
        self.topAnchor.constraint(equalTo: superView.topAnchor, constant: marging).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -marging).isActive = true
    }
}
