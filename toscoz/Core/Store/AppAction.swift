//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

enum AppAction: Equatable {
//    case login
//    case fetchMyAlbums
//    case listMyAlbums

    case autorize
//    case autorizeGrantedResult(Result<String, NetworkFailure>)

    case loadMyAlbums
    case loadMyalbumsResponse(Result<[Album], NetworkFailure>)

    case settingsButtonTapped
    case settingsScreenDismissed
}
