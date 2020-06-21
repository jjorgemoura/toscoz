//
//  Copyright © 2020  Jorge Moura. All rights reserved.
//

@testable import toscoz
import XCTest
import Foundation

class UserDefaultTests: XCTestCase {

    let newStoredValue1 = "hello"
    let newStoredValue2 = "world"

    func testWhenSettingNilThenTheStoredValueIsNil() {

        // GIVEN:
        var sut = FakeLocalPersistenceStore()

        // WHEN:
        sut.test1 = newStoredValue1
        sut.test1 = nil

        // THEN:
        XCTAssertNil(sut.test1)
    }

    func testWhenSettingValueThenTheStoredValueIsSameValue() {

        // GIVEN:
        var sut = FakeLocalPersistenceStore()

        // WHEN:
        sut.test2 = newStoredValue1

        // THEN:
        XCTAssertEqual(sut.test2, newStoredValue1)
    }

    func testWhenSettingValuesThenTheStoredValueIsLastValue() {

        // GIVEN:
        var sut = FakeLocalPersistenceStore()

        // WHEN:
        sut.test2 = newStoredValue1
        sut.test2 = newStoredValue2

        // THEN:
        XCTAssertEqual(sut.test2, newStoredValue2)
    }

    func testWhenSettingReadingUnsetThenTheStoredValueIsDefaultValue() {

        // GIVEN:
        let sut = FakeLocalPersistenceStore()

        // WHEN:
        let test3Value = sut.test3

        // THEN:
        XCTAssertEqual(test3Value, 5)
    }

    func testWhenSettingReadingUnsetThenTheStoredValueIsNilDefaultValue() {

        // GIVEN:
        let sut = FakeLocalPersistenceStore()

        // WHEN:
        let test4Value = sut.test4

        // THEN:
        XCTAssertNil(test4Value)
    }
}
