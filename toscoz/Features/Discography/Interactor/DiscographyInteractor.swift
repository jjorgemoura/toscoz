//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

struct DiscographyInteractor {

    let repo: DiscographyRepository

    func fetchData() -> [Discography] {

        repo.loadDiscography()
    }

    func fetchData(completion: ([Discography]) -> Void ) {

        completion(repo.loadDiscography())
    }
}
