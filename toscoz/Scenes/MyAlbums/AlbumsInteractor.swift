//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

struct AlbumsInteractor {

    let repo: AlbumsRepository

    func fetchData() -> [Album] {

        repo.loadAlbums()
    }

    func fetchData(completion: ([Album]) -> Void ) {

        completion(repo.loadAlbums())
    }
}
