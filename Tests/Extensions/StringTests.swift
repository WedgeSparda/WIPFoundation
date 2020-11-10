// MIT License
//
// Copyright (c) [2020] [Roberto Pastor Ortiz]
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

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

    static let linuxSupportedTests = [
        ("testStringHasLetters", testStringHasLetters),
        ("testStringHasNumbers", testStringHasNumbers),
        ("testStringIsAlphabetic", testStringIsAlphabetic),
        ("testStringIsAlphaNumeric", testStringIsAlphaNumeric),
        ("testStringIsNumeric", testStringIsNumeric),
        ("testBase64Encode", testBase64Encode),
        ("testBase64Decode", testBase64Decode),
        ("testURLEncoding", testURLEncoding),
        ("testTrimming", testTrimming),
        ("testStringToDate", testStringToDate),
        ("testIncorrectStringToDate", testIncorrectStringToDate),
        ("testNSRange", testNSRange)
    ]

    // MARK: - Without Linux Support

    #if !os(Linux)
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

    static let linuxUnsupportedTests = [
        ("testValidEmail", testValidEmail),
        ("testValidURL", testValidURL)
    ]
    #endif
}
