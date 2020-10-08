import XCTest
@testable import WIPFoundation

class StringTests: XCTestCase {

    private let testString = "THIS IS A TEST!"
    private let base64EncodedTestString = "VEhJUyBJUyBBIFRFU1Qh"

    func testStringHasLetters() {
        XCTAssertTrue("abc".wip.hasLetters)
        XCTAssertTrue("abc123".wip.hasLetters)
        XCTAssertFalse("123".wip.hasLetters)
    }

    func testStringHasNumbers() {
        XCTAssertFalse("abc".wip.hasNumbers)
        XCTAssertTrue("abc123".wip.hasNumbers)
        XCTAssertTrue("123".wip.hasNumbers)
    }

    func testStringIsAlphabetic() {
        XCTAssertTrue("abc".wip.isAlphabetic)
        XCTAssertFalse("abc123".wip.isAlphabetic)
        XCTAssertFalse("123".wip.isAlphabetic)
    }

    func testStringIsAlphaNumeric() {
        XCTAssertFalse("abc".wip.isAlphaNumeric)
        XCTAssertTrue("abc123".wip.isAlphaNumeric)
        XCTAssertFalse("123".wip.isAlphaNumeric)
    }

    func testStringIsNumeric() {
        XCTAssertFalse("abc".wip.isNumeric)
        XCTAssertFalse("abc123".wip.isNumeric)
        XCTAssertTrue("123".wip.isNumeric)
    }

    func testBase64Encode() {
        XCTAssertEqual(testString.wip.base64Encoded,
                       base64EncodedTestString)
    }

    func testBase64Decode() {
        XCTAssertEqual(base64EncodedTestString.wip.base64Decoded,
                       testString)
    }
}
