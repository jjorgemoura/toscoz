//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import UIKit
import os.log

class DiscographyViewModel: NSObject {

    private var discographyList: [Discography] = []

    let interactor: DiscographyInteractor

    init(interactor: DiscographyInteractor) {
        self.interactor = interactor
    }

    func fetchData() {
        //        let album1 = Discography(title: "Animals", artist: "Pink Floyd", year: "1977", artwork: nil)
        //        let album2 = Discography(title: "Frances the Mute", artist: "The Mars Volta", year: "2003", artwork: nil)
        //        let album3 = Discography(title: "Chocolate", artist: "Omar Rodriguez LopeZ", year: "2017", artwork: nil)
        //        let album4 = Discography(title: "The Top", artist: "The Cure", year: "1984", artwork: nil)
        //        let album5 = Discography(title: "Mao Morta", artist: "Mao Morta", year: "1998", artwork: nil)
        //        let album6 = Discography(title: "Black Lights", artist: "Samaris", year: "2016", artwork: nil)
        //        let album7 = Discography(title: "A Trick of the Tail", artist: "Genesis", year: "1976", artwork: nil)
        //        let album8 = Discography(title: "Overpowered", artist: "Roisin Murphy", year: "2007", artwork: nil)
        //
        //        data = [album1, album2, album3, album4, album5, album6, album7, album8]

        interactor.fetchData { data in
            discographyList = data
        }
    }
}

extension DiscographyViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        discographyList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DiscographyViewCell.cellIdentifier, for: indexPath) as? DiscographyViewCell {
            let viewModel = discographyList[indexPath.row]
            cell.configure(viewModel: viewModel)
            return cell
        }

        os_log("asdsadasd")
        return UITableViewCell()
    }
}

extension DiscographyViewModel: UITableViewDelegate {
}
