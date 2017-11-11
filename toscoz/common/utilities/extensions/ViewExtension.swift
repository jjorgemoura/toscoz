//
//  UIExtension.swift
//  toscoz
//
//  Created by Jorge Moura on 02/11/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import UIKit

extension UIView {

//    func apply<T: PrimaryButton>(style: T) {
//
//        option 1
//        let xxx: UIButton = UIButton(type: .roundedRect)
//        let z1 = PrimaryButton()
//        z1.the(view: self)
//        z1.the(view: xxx)
//
//        option 2
//        style.the(view: self)
//    }

    func apply(style: Styler) {
        style.the(view: self)
    }
}
