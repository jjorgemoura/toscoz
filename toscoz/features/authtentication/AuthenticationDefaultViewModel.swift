//
//  AuthenticationDefaultViewModel.swift
//  toscoz
//
//  Created by Jorge Moura on 21/10/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift

class AuthenticationDefaultViewModel: AuthenticationViewModel {

    // ViewModel Data to be presented / shown on View/ViewController
    let didCancel: Observable<Void>
    let didAuthenticateSuccessfully: Observable<UserToken>
    let didFailedAuthentication: Observable<String>

    let loginAction: Observable<SportifyCredentials>

    // ViewModel actions to be triggered / called from the View/ViewController
    let login: AnyObserver<SportifyCredentials>
    let cancel: AnyObserver<Void>

    deinit {
        print("JM - D3 -> \(Unmanaged<AnyObject>.passUnretained(self as AnyObject).toOpaque())")
    }

    init(spotifyService: SpotifyService = SpotifyWebService()) {
//        print("JM - 3 -> \(self)")
        print("JM - 3")
        let cancelation = PublishSubject<Void>()
        cancel = cancelation.asObserver()
        didCancel = cancelation.asObservable()

        let authentication = PublishSubject<SportifyCredentials>()
        login = authentication.asObserver()
        loginAction = authentication.asObservable()

        didAuthenticateSuccessfully = PublishSubject<UserToken>().asObservable()

        didFailedAuthentication = PublishSubject<String>().asObservable()
    }
}
