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
		("testExecute", testExecute),
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
		XCTAssertEqual(operation.rawState, .ready)
		XCTAssertTrue(operation.isReady)
		XCTAssertFalse(operation.isExecuting)
		XCTAssertFalse(operation.isFinished)
		XCTAssertFalse(operation.isCancelled)
		XCTAssertTrue(operation.isConcurrent)
	}
	
	// MARK: Functions
	
	func testCancel() {
		let operation = ConcurrentOperation()
		
		operation.cancel()
		
		XCTAssertEqual(operation.rawState, .ready)
		XCTAssertTrue(operation.isReady)
		XCTAssertFalse(operation.isExecuting)
		XCTAssertFalse(operation.isFinished)
		XCTAssertTrue(operation.isCancelled)
	}
	
	func testPrepare() {
		let operation = ConcurrentOperation()
		
		operation.prepare()
		
		XCTAssertEqual(operation.rawState, .ready)
		XCTAssertTrue(operation.isReady)
		XCTAssertFalse(operation.isExecuting)
		XCTAssertFalse(operation.isFinished)
		XCTAssertFalse(operation.isCancelled)
	}
	
	func testPrepareWhenCancelled() {
		let operation = ConcurrentOperation()
		
		operation.cancel()
		operation.prepare()
		
		XCTAssertEqual(operation.rawState, .finished)
		XCTAssertFalse(operation.isReady)
		XCTAssertFalse(operation.isExecuting)
		XCTAssertTrue(operation.isFinished)
		XCTAssertTrue(operation.isCancelled)
	}
	
	func testExecute() {
		let operation = ConcurrentOperation()
		
		operation.execute()
		
		XCTAssertEqual(operation.rawState, .executing)
		XCTAssertFalse(operation.isReady)
		XCTAssertTrue(operation.isExecuting)
		XCTAssertFalse(operation.isFinished)
		XCTAssertFalse(operation.isCancelled)
	}
	
	func testFinish() {
		let operation = ConcurrentOperation()
		
		operation.finish()
		
		XCTAssertEqual(operation.rawState, .finished)
		XCTAssertFalse(operation.isReady)
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
		operation.execute()
		operation.pause()
		
		XCTAssertEqual(operation.rawState, .paused)
		XCTAssertFalse(operation.isReady)
		XCTAssertFalse(operation.isExecuting)
		XCTAssertFalse(operation.isFinished)
		XCTAssertFalse(operation.isCancelled)
	}
	
	// MARK: ResumeableOperation tests
	
	func testResume() {
		let operation = ConcurrentOperation()
		
		operation.prepare()
		operation.execute()
		operation.pause()
		operation.resume()
		
		XCTAssertEqual(operation.rawState, .executing)
		XCTAssertFalse(operation.isReady)
		XCTAssertTrue(operation.isExecuting)
		XCTAssertFalse(operation.isFinished)
		XCTAssertFalse(operation.isCancelled)
	}
	
}
