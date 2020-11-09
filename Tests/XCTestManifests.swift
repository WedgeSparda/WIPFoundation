import XCTest

#if os(Linux)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(StringTests.linuxSupportedTests)
    ]
}
#endif
