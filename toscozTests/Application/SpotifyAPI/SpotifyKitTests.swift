//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

@testable import toscoz
import XCTest
import Foundation

class SpotifyKitTests: XCTestCase {

    let oldTimestamp: TimeInterval = 342341
    let validTimestamp: TimeInterval = Date().timeIntervalSince1970

    func testWhenCheckOldTimestampThenResultsAsNotValid() {

        // GIVEN:
        let sut = SpotifyKit()

        // WHEN:
        let isValid = sut.isTokenValid(tokenTimestamp: oldTimestamp)

        // THEN:
        XCTAssertFalse(isValid)
    }

    func testWhenCheckRightNowTimestampThenResultsAsValid() {

        // GIVEN:
        let sut = SpotifyKit()

        // WHEN:
        let isValid = sut.isTokenValid(tokenTimestamp: validTimestamp)

        // THEN:
        XCTAssertTrue(isValid)
    }
}
