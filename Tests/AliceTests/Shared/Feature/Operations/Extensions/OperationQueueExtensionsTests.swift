//
//  OperationQueueExtensionsTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 20/04/2019.
//

import XCTest
import Foundation

@testable import Alice

class OperationQueueExtensionsTests: XCTestCase {

	// MARK: Constants
	
	private let queue = OperationQueue(name: .test)
	
	// MARK: Static
	
	static var allTests = [
		("testInitWithName", testInitWithName),
		("testInitWithNameAndMaxConcurrentOperationCount", testInitWithNameAndMaxConcurrentOperationCount),
		("testInitWithNameMaxConcurrentOperationCountAndQualityOfService", testInitWithNameMaxConcurrentOperationCountAndQualityOfService),
		("testAddOperations", testAddOperations),
		("testAddChainedOperations", testAddChainedOperations),
		("testPauseAllOperations", testPauseAllOperations),
		("testResumeAlloperations", testResumeAlloperations),
	]
	
	// MARK: Setup
	
    override func tearDown() {
		queue.cancelAllOperations()
    }
	
	// MARK: Initializers tests
	
	func testInitWithName() {
		let queue = OperationQueue(name: .test)
		
		XCTAssertNotNil(queue)
		XCTAssertEqual(queue.name, OperationQueue.Name.test.value)
		XCTAssertEqual(queue.maxConcurrentOperationCount, OperationQueue.defaultMaxConcurrentOperationCount)
		XCTAssertEqual(queue.qualityOfService, .default)
	}
	
	func testInitWithNameAndMaxConcurrentOperationCount() {
		let queue = OperationQueue(name: .test,
								   maxConcurrentOperationCount: 4)
		
		XCTAssertNotNil(queue)
		XCTAssertEqual(queue.name, OperationQueue.Name.test.value)
		XCTAssertEqual(queue.maxConcurrentOperationCount, 4)
		XCTAssertEqual(queue.qualityOfService, .default)
	}
	
	func testInitWithNameMaxConcurrentOperationCountAndQualityOfService() {
		let queue = OperationQueue(name: .test,
								   maxConcurrentOperationCount: 3,
								   qualityOfService: .background)
		
		XCTAssertNotNil(queue)
		XCTAssertEqual(queue.name, OperationQueue.Name.test.value)
		XCTAssertEqual(queue.maxConcurrentOperationCount, 3)
		XCTAssertEqual(queue.qualityOfService, .background)
	}
	
	// MARK: Functions tests
	
	func testAddOperations() {
		let firstOperation = Operation()
		let secondOperation = Operation()
		let thirdOperation = Operation()
		
		queue.isSuspended = true

		queue.addOperations([
			firstOperation,
			secondOperation,
			thirdOperation
		])

		XCTAssertEqual(queue.operations.count, 3)
	}
	
	func testAddChainedOperations() {
		let firstOperation = Operation()
		let secondOperation = Operation()
		let thirdOperation = Operation()
		
		queue.isSuspended = true

		queue.addChainedOperations([
			firstOperation,
			secondOperation,
			thirdOperation
		])

		XCTAssertEqual(queue.operations.count, 3)
		XCTAssertEqual(queue.operations.first, firstOperation)
		XCTAssertEqual(queue.operations.first?.dependencies, [])
		XCTAssertEqual(queue.operations.last, thirdOperation)
		XCTAssertEqual(queue.operations.last?.dependencies, [secondOperation])
	}
	
	func testPauseAllOperations() {
		queue.addOperations([
			ConcurrentOperation(),
			Operation(),
			ConcurrentOperation(),
		])
		queue.pauseAllOperations()
		
		XCTAssertTrue(queue.isSuspended)
		
		queue.operations.forEach { operation in
			XCTAssertFalse(operation.isExecuting)
		}
	}
	
	func testResumeAlloperations() {
		queue.addOperations([
			ConcurrentOperation(),
			Operation(),
			ConcurrentOperation(),
		])
		queue.pauseAllOperations()
		queue.resumeAllOperations()

		XCTAssertFalse(queue.isSuspended)
		
		queue.isSuspended = true
		
		queue.operations.forEach { operation in
			XCTAssertTrue(operation.isExecuting)
		}
	}

}
