//
//  Coordinator.swift
//  toscoz
//
//  Created by Jorge Moura on 16/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift
import UIKit

/// The Coordinator protocol defines what is a coordinator in the MVVM+Coordinators architecture in the iOS world.
/// 
/// This use of coordinators is built on top Functional Reactive Programming (FRP), more specificaly, on RxSwift.
/// The coordinator protocol as a associatedtype. Each concrete coordinator must specify the his type.
/// The coordinator type is used to define the Observable type returned on the start method.
/// The observable works as the return / result of a screen and acts as a delegate to move on to another coordinator (screen).
///
/// ````
/// //Defines the observable's type of start method.
/// associatedtype T
/// ````
protocol Coordinator {

    associatedtype T

    /// The method that starts the coordinator.
    ///
    /// - Returns: The Result of coordinator as an Observable stream. The type the observable is defined by the associated type.
    func start() -> Observable<T>
}
