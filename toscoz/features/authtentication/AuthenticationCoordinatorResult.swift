//
//  AuthenticationCoordinatorResult.swift
//  toscoz
//
//  Created by Jorge Moura on 23/10/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

/// Type that defines the coordination results of the `AuthenticationCoordinatorResult`.
enum AuthenticationCoordinatorResult {

    /// The authentication was done successfully, returning also the `userToken`.
    case authenticationSuccessful(token: UserToken)

    /// Cancel button was tapped.
    case cancel
}
