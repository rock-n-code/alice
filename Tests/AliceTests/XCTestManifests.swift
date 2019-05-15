import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
		testCase(IdentifiableTests.allTests),
		testCase(PauseableTests.allTests),
		testCase(ResumeableTests.allTests),
		testCase(BooleableTests.allTests),
		testCase(URLableTests.allTests),
		testCase(ValueTests.allTests),
		testCase(StringExtensionsTests.allTests),
		testCase(ConcurrentOperationTests.allTests),
		testCase(OperationQueueExtensionsTests.allTests),
		testCase(DataStackModelTests.allTests),
		testCase(DataStackStoreTests.allTests),
		testCase(DataStackTests.allTests),
		testCase(StringExtensionsTests.allTests),
		testCase(NSPersistentStoreDescriptionExtensionsTests.allTests),
	]
}
#endif
