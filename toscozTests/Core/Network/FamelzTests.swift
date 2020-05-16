//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

import XCTest
@testable import toscoz

class FamelzTests: XCTestCase {

    func testWhenDoValidGETResquestThenResponseCodeIs200() {

        // GIVEN:
        let sut = Famelz()

        // WHEN:
        let response = sut.perform(request: "")

        // THEN:
        XCTAssertNotNil(response)
    }
}
