//
//  AuthenticationDefaultViewModel.swift
//  toscoz
//
//  Created by Jorge Moura on 21/10/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift

class AuthenticationDefaultViewModel: AuthenticationViewModel {

    private var bag: DisposeBag = DisposeBag()

    // ViewModel Delegate / Observables to others (coordinators) to observe
    var didCancel: Observable<Void>
    var didAuthenticateSuccessfully: Observable<UserToken>
    var didFailedAuthentication: Observable<String>

    // ViewModel actions to be triggered / called from the View/ViewController
    var cancel: AnyObserver<Void>
    var login: AnyObserver<SportifyCredentials>

    deinit {
        print("JM - D3 -> \(Unmanaged<AnyObject>.passUnretained(self as AnyObject).toOpaque())")
    }

    init(spotifyService: SpotifyService = SpotifyWebService()) {
        let cancelation = PublishSubject<Void>()
        cancel = cancelation.asObserver()
        didCancel = cancelation.asObservable()

        didAuthenticateSuccessfully = PublishSubject<UserToken>().asObservable()
        didFailedAuthentication = PublishSubject<String>().asObservable()
        
        let authentication = PublishSubject<SportifyCredentials>()
        login = authentication.asObserver()
        authentication.asObservable().subscribe(onNext: { spotifyCredentials in

        }, onError: { error in

        }, onCompleted: {

        }).disposed(by: bag)
    }
}
