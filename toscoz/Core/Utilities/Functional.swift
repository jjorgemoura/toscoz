//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

precedencegroup ForwardApplication {
    associativity: left
    higherThan: AssignmentPrecedence
}

/// This operator is called pipe-forward.
infix operator |> : ForwardApplication

/** This function is one use of the pipe-forward operator. Overtune call it *with*.
 - Parameters:
   - x: a value
   - f: a function that has as input the same type as x.
 - Returns: returns something with same type the return type of f.
*/
func |> <T, U>(x: T, f: (T) -> U) -> U {
    return f(x)
}

precedencegroup ForwardComposition {
    associativity: right
    higherThan: ForwardApplication
}

infix operator >>>: ForwardComposition

/** A generic function that has two functions as parameters and return a function that composes the two inputs. Overtune call it *pipe*.

    The operator has a requierement that return type of the function *f* must the the same as the input type of function *g*

 - Parameters:
   - f: a generic function f with input of type *A* and returns type *B*
   - g: a generic function f with input of type *B* and returns type *C*
 - Returns: return a generic composed function that has type *A* as inout and returns type *C*
 */
func >>> <A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return { a in
        g(f(a))
    }
}
