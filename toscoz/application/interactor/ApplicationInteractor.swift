//
//  Copyright © 2021  ___ORGANIZATIONNAME___ . All rights reserved.

struct ApplicationInteractor {

    let router: Router

    func onEvent(event: AppStarted) {
        router.presentRoot()
    }
}
