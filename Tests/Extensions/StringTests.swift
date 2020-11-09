import XCTest
@testable import WIPFoundation

class StringTests: XCTestCase {

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
        let given = "THIS IS A TEST!"
        let expected = "VEhJUyBJUyBBIFRFU1Qh"

        XCTAssertEqual(given.wip.base64Encoded, expected)
    }

    func testBase64Decode() {
        let given = "VEhJUyBJUyBBIFRFU1Qh"
        let expected = "THIS IS A TEST!"

        XCTAssertEqual(given.wip.base64Decoded, expected)
    }

    func testURLEncoding() {
        let given = "Text for URL QUERY with weird characters like 'ñá'"
        let expected = "Text%20for%20URL%20QUERY%20with%20weird%20characters%20like%20\'%C3%B1%C3%A1\'"

        XCTAssertEqual(given.wip.encodedForURLQuery, expected)
    }

    func testTrimming() {
        let given = "  Trimm this   "
        let expected = "Trimm this"

        XCTAssertEqual(given.wip.trimmed, expected)
    }

    func testValidEmail() {
        let email = "foaisdhfoiasdfaoisdf"
        XCTAssertFalse(email.wip.isValidEmail())
    }

    func testValidURL() {
        let givenValidURL = "http://www.google.es"
        let givenInvalidURL = "/agusiha7bgu/usvukdsvkua/bj"

        XCTAssertTrue(givenValidURL.wip.isValidURL)
        XCTAssertFalse(givenInvalidURL.wip.isValidURL)
    }

    func testStringToDate() {
        let given = "10/07/1981"
        let expected = given.wip.date(withFormat: "dd/MM/yyyy")

        XCTAssertNotNil(expected)
    }

    func testIncorrectStringToDate() {
        let given = "This is not a date"
        let expected = given.wip.date(withFormat: "dd/MM/yyyy")

        XCTAssertNil(expected)
    }

    func testNSRange() {
        let given = "This is a text"

        XCTAssertEqual(given.wip.nsrange.length, 14)
        XCTAssertEqual(given.wip.nsrange.location, 0)
    }
}
