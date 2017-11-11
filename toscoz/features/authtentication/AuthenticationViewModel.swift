//
//  AuthenticationViewModel.swift
//  toscoz
//
//  Created by Jorge Moura on 21/10/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift

protocol AuthenticationViewModel {

    var didCancel: Observable<Void> { get set }
    var didAuthenticateSuccessfully: Observable<UserToken> { get set }
    var didFailedAuthentication: Observable<String> { get set }

    var loginAction: Observable<SportifyCredentials> { get set }

    var login: AnyObserver<SportifyCredentials> { get set }
    var cancel: AnyObserver<Void> { get set }
}
