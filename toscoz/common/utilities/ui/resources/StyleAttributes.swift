//
//  UIAttributes.swift
//  toscoz
//
//  Created by Jorge Moura on 02/11/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

enum StyleAttributes: Hashable {

    case fontColor
    case fontType
    case color
    case caption

    static func == (lhs: StyleAttributes, rhs: StyleAttributes) -> Bool {
        return lhs == rhs
    }

    var hashValue: Int {
        return self.hashValue
    }
}
