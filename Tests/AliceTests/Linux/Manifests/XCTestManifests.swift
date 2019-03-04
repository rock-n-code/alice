import XCTest

#if os(Linux)
public func allTests() -> [XCTestCaseEntry] {
    return [testCase(IdentifiableTests.allTests),
			testCase(IntExtensionsTests.allTests),
			testCase(ScriptTests.allTests),
			testCase(ScriptableTests.allTests),]
}
#endif
