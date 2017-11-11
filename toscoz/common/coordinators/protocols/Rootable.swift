//
//  Rootable.swift
//  toscoz
//
//  Created by Jorge Moura on 20/10/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import UIKit

/// Rootable is a protocol to be use by the `Coordinator`.
///
/// This should be used on coordinators that are shown as root view controllers, not as part of a navigation or tabbar view controllers.
protocol Rootable {

    /// The `UIWindow` that host the root view controller.
    var window: UIWindow { get }
}
