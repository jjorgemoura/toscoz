//
//  BaseCoordinator.swift
//  toscoz
//
//  Created by Jorge Moura on 11/11/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import Foundation
import RxSwift
import sapataz

class BaseCoordinator {

    /// Utility `DisposeBag` used by the subclasses.
    let bag: DisposeBag = DisposeBag()

    /// Unique identifier.
    let identifier: UUID = UUID()

    private var childCoordinators: [UUID: BaseCoordinator] = [UUID: BaseCoordinator]()

    /// Stores coordinator to the `childCoordinators` dictionary.
    ///
    /// - Parameter coordinator: Child coordinator to store.
    private func store(coordinator: BaseCoordinator) {
        childCoordinators[coordinator.identifier] = coordinator
        
        let identifier = Identifier().generate()
    }

    /// Release coordinator from the `childCoordinators` dictionary.
    ///
    /// - Parameter coordinator: Coordinator to release.
    private func free(coordinator: BaseCoordinator) {
        childCoordinators[coordinator.identifier] = nil
    }
}
