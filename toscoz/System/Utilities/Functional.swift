//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

precedencegroup ForwardApplication {
    associativity: left
    higherThan: AssignmentPrecedence
}

/// This operator is called pipe-forward.
infix operator |> : ForwardApplication

/// This function is one use of the pipe-forward operator.
/// - Parameters:
///   - x: a value
///   - f: a function that has as input the same type as x.
/// - Returns: returns something with same type the return type of f.
func |> <T, U>(x: T, f: (T) -> U) -> U {
    f(x)
}
