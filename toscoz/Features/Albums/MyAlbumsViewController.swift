//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import UIKit
//import os.log

class MyAlbumsViewController: UIViewController {

    private var tableView: UITableView?

    var viewModel: MyAlbumsViewModel?

    override func loadView() {
        viewModel = MyAlbumsViewModel()
        
        let mainTableView = UITableView(frame: .zero, style: .plain)
        mainTableView.delegate = viewModel
        mainTableView.dataSource = viewModel

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

        viewModel?.fetchData()
    }
}
