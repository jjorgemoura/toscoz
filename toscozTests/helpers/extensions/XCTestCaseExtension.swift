//
//  XCTestCaseExtension.swift
//  toscozTests
//
//  Created by Jorge Moura on 13/11/2017.
//  Copyright © 2017 Jorge Moura. All rights reserved.
//

import XCTest

extension XCTestCase {

    /// Conform to LocalizedError in order to be able to output a error message.
    private struct RequireError<T>: LocalizedError {

        let file: StaticString
        let line: Int

        var errorDescription: String? {
            return "😱 Required value of type \(T.self) was nil at line \(line) in file \(file)."
        }
    }

    /// Using file and line lets us automatically capture where the expression took place in our source code.
    func require<T>(_ expression: @autoclosure () -> T?, file: StaticString = #file, line: Int = #line) throws -> T {
        guard let value = expression() else {
            throw RequireError<T>(file: file, line: line)
        }

        return value
    }
}
