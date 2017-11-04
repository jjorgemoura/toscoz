//
//  File.swift
//  toscoz
//
//  Created by Jorge Moura on 04/11/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import UIKit

struct Styler: Style {

    private let styler: (UIView) -> Void

    init<T: Style>(with style: T) {
        print(T.self)
        print(T.T.self)
        styler = { view in
            //T.T means the type (associated type) of Style
            guard let v = view as? T.T else {
                print("oopsss, the style \(style) doesn't apply to view: \(view.description)!")
                return
            }
            style.the(view: v)
        }
    }

    func the(view: UIView) {
        styler(view)
    }
}
