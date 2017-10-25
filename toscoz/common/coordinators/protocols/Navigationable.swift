//
//  Navigationable.swift
//  toscoz
//
//  Created by Jorge Moura on 20/10/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import UIKit

/// Navigationable is a protocol to be use by the `Coordinator`.
///
/// This should be used on coordinators that are shown in a navigation controller, not as a root or modal view controllers.
protocol Navigationable {

    /// The `UINavigationController` that hosts the view controller.
    var navigationController: UINavigationController { get }
}
