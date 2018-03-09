//
//  UserDefaultViewModel.swift
//  toscoz
//
//  Created by Jorge Moura on 21/10/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift

class UserDefaultViewModel: UserViewModel {

    // ViewModel Delegate / Observables to others (coordinators) to observe
    var didPressGoToAuthenticate: Observable<Void>
    var didPressGoToHomepage: Observable<Void>

    // ViewModel actions to be triggered / called from the View/ViewController
    var authenticate: AnyObserver<Void>
    var homepage: AnyObserver<Void>

    var user: String?
    var isLoggedIn: Bool { return user != nil }

    deinit {
        print("JM - D7 -> \(Unmanaged<AnyObject>.passUnretained(self as AnyObject).toOpaque())")
    }

    init() {
        let authentication = PublishSubject<Void>()
        authenticate = authentication.asObserver()
        didPressGoToAuthenticate = authentication.asObservable()

        let homepageNavigation = PublishSubject<Void>()
        homepage = homepageNavigation.asObserver()
        didPressGoToHomepage = homepageNavigation.asObservable()
    }
}
