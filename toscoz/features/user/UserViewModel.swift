//
//  UserViewModel.swift
//  toscoz
//
//  Created by Jorge Moura on 21/10/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift

protocol UserViewModel {

    // ViewModel Delegate / Observables to others (coordinators) to observe
    var didPressGoToAuthenticate: Observable<Void> { get set }
    var didPressGoToHomepage: Observable<Void> { get set }

    // ViewModel actions to be triggered / called from the View/ViewController
    var authenticate: AnyObserver<Void> { get set }
    var homepage: AnyObserver<Void> { get set }

    var user: String? { get }
    var isLoggedIn: Bool { get }
}
