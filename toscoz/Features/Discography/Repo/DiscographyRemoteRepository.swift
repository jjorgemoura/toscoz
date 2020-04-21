//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import UIKit

struct DiscographyRemoteRepository: DiscographyRepository {

    func loadDiscography() -> [Discography] {

//        let httpRepo = HTTPRepository.standard()

        let spo = "https://accounts.spotify.com/en/authorize?scope=user-read-private&client_id=1111111111111&redirect_uri=toscoz://callback/&response_type=token"

        if let url = URL(string: spo) {
            //httpRepo.read(from: url)
            UIApplication.shared.open(url)
        }

        return []
    }
}
