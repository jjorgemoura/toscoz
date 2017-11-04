//
//  Style.swift
//  toscoz
//
//  Created by Jorge Moura on 02/11/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import UIKit

protocol Style {

    //UIControl
    associatedtype T: UIView

    func the(view: T)
}
