//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import UIKit
//import os.log

class DiscographyViewController: UIViewController {

    private var tableView: UITableView?

    var viewModel: DiscographyViewModel?

    override func loadView() {
        viewModel = DiscographyViewModel(interactor: DiscographyInteractor(repo: DiscographyRemoteRepository()))

        let mainTableView = UITableView(frame: .zero, style: .plain)
        mainTableView.delegate = viewModel
        mainTableView.dataSource = viewModel

        mainTableView.register(UINib(nibName: "DiscographyViewCell", bundle: nil), forCellReuseIdentifier: DiscographyViewCell.cellIdentifier)

        view = mainTableView
        tableView = mainTableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Albums"

        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = 116
        tableView?.backgroundColor = .yellow

        viewModel?.fetchData()
    }
}
