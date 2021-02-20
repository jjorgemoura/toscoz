//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

import Foundation

protocol Router {
    func presentRoot()
    func showAlbumScreen(with album: UUID)
}
