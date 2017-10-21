//
//  Coordinator.swift
//  toscoz
//
//  Created by Jorge Moura on 16/07/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import RxSwift
import UIKit

protocol Coordinator {

    associatedtype T

    func start() -> Observable<T>
}

extension Coordinator {

}
