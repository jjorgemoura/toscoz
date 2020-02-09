//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import UIKit
import os.log

class MyAlbumsViewController: UIViewController {

    private var tableView: UITableView?

    var viewModel: MyAlbumsViewModel?

    override func loadView() {
        let mainTableView = UITableView(frame: .zero, style: .plain)
        mainTableView.delegate = self
        mainTableView.dataSource = self

        mainTableView.register(UINib(nibName: "MyAlbumsViewCell", bundle: nil), forCellReuseIdentifier: MyAlbumsViewCell.cellIdentifier)

        view = mainTableView
        tableView = mainTableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Albums"

        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = 116
        tableView?.backgroundColor = .yellow
    }
}

extension MyAlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MyAlbumsViewCell.cellIdentifier, for: indexPath) as? MyAlbumsViewCell {
            cell.configure(viewModel: "adsfadsf")
            return cell
        }

        os_log("asdsadasd")
        return UITableViewCell()
    }
}

extension MyAlbumsViewController: UITableViewDelegate {
}
