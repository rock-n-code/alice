import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [testCase(IdentifiableTests.allTests),
			testCase(ScriptTests.allTests),
			testCase(ScriptableTests.allTests),]
}
#endif
