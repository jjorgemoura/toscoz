//
//  AuthenticationViewModel.swift
//  toscoz
//
//  Created by Jorge Moura on 21/10/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift

protocol AuthenticationViewModel {

    var didCancel: Observable<Void> { get }
    var didAuthenticateSuccessfully: Observable<UserToken> { get }
    var didFailedAuthentication: Observable<String> { get }

    var loginAction: Observable<SportifyCredentials> { get }

    var login: AnyObserver<SportifyCredentials> { get }
    var cancel: AnyObserver<Void> { get }
}
