//
//  ConcurrentOperationTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 20/04/2019.
//

import XCTest
import Foundation

@testable import Alice

class ConcurrentOperationTests: XCTestCase {

	// MARK: Static
	
	static var allTests = [
		("testInit", testInit),
		("testCancel", testCancel),
		("testPrepare", testPrepare),
		("testPrepareWhenCancelled", testPrepareWhenCancelled),
		("testFinish", testFinish),
		("testIsAsynchronous", testIsAsynchronous),
		("testPause", testPause),
		("testResume", testResume),
	]
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}

	// MARK: Initializers tests
	
	func testInit() {
		let operation = ConcurrentOperation()
		
		XCTAssertNotNil(operation)
		XCTAssertFalse(operation.isExecuting)
		XCTAssertFalse(operation.isFinished)
		XCTAssertFalse(operation.isCancelled)
		XCTAssertTrue(operation.isConcurrent)
	}
	
	// MARK: Functions
	
	func testCancel() {
		let operation = ConcurrentOperation()
		
		operation.cancel()
		
		XCTAssertFalse(operation.isExecuting)
		XCTAssertFalse(operation.isFinished)
		XCTAssertTrue(operation.isCancelled)
	}
	
	func testPrepare() {
		let operation = ConcurrentOperation()
		
		operation.prepare()
		
		XCTAssertTrue(operation.isExecuting)
		XCTAssertFalse(operation.isFinished)
		XCTAssertFalse(operation.isCancelled)
	}
	
	func testPrepareWhenCancelled() {
		let operation = ConcurrentOperation()
		
		operation.cancel()
		operation.prepare()
		
		XCTAssertFalse(operation.isExecuting)
		XCTAssertTrue(operation.isFinished)
		XCTAssertTrue(operation.isCancelled)
	}
	
	func testFinish() {
		let operation = ConcurrentOperation()
		
		operation.finish()
		
		XCTAssertFalse(operation.isExecuting)
		XCTAssertTrue(operation.isFinished)
		XCTAssertFalse(operation.isCancelled)
	}
	
	// MARK: Operation tests
	
	func testIsAsynchronous() {
		XCTAssertTrue(ConcurrentOperation().isAsynchronous)
	}
	
	// MARK: PauseableOperation tests
	
	func testPause() {
		let operation = ConcurrentOperation()
		
		operation.prepare()
		operation.pause()
		
		XCTAssertFalse(operation.isExecuting)
		XCTAssertFalse(operation.isFinished)
		XCTAssertFalse(operation.isCancelled)
	}
	
	// MARK: ResumeableOperation tests
	
	func testResume() {
		let operation = ConcurrentOperation()
		
		operation.prepare()
		operation.pause()
		operation.resume()
		
		XCTAssertTrue(operation.isExecuting)
		XCTAssertFalse(operation.isFinished)
		XCTAssertFalse(operation.isCancelled)
	}
	
}
