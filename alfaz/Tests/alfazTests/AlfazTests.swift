import XCTest
@testable import alfaz

final class AlfazTests: XCTestCase {

    static var allTests = [
        ("testExample", testExample)
    ]

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(alfaz().text, "Hello, World!")
    }
}
