//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

enum AppAction: Equatable {
    case autorize

    case loadMyAlbums
    case loadMyalbumsResponse(Result<UserAlbumsResponse, NetworkFailure>)

    case settingsButtonTapped
    case settingsScreenDismissed
}
