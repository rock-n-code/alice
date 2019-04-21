//
//  ConcurrentOperation.swift
//  Alice
//
//  Created by Javier Cicchelli on 20/04/2019.
//

import Foundation

/// Concurrent operation implementation based on Apple's documentation.
open class ConcurrentOperation: Operation {
	
	// MARK: Constants
	
	private struct Key {
		fileprivate static let isExecuting = "isExecuting"
		fileprivate static let isFinished = "isFinished"
	}
	
	// MARK: Properties

	/// Set if the operation is executing.
	private var _executing: Bool {
		willSet {
			willChangeValue(forKey: Key.isExecuting)
		}
		didSet {
			didChangeValue(forKey: Key.isExecuting)
		}
	}
	
	/// Set if the operation is finished.
	private var _finished: Bool {
		willSet {
			willChangeValue(forKey: Key.isFinished)
		}
		didSet {
			didChangeValue(forKey: Key.isFinished)
		}
	}
	
	// MARK: Initializers
	
	/// Default initializer.
	public override init() {
		self._executing = false
		self._finished = false
	}
	
	// MARK: Functions
	
	/// Prepares the operation for execution.
	///
	/// - Note: Must be called at the beginning of the overriden `start()` function.
	public func prepare() {
		guard !isCancelled else {
			finish()
			return
		}
		
		_executing = true
	}
	
	/// Notifies the completion of concurrent task and hence the completion of the operation.
	///
	/// - Note: Must be called when the operation is finished.
	public func finish() {
		_executing = false
		_finished = true
	}
	
	// MARK: Operation
	
	/// Sets the operation as asynchronous.
	open override var isAsynchronous: Bool {
		return true
	}
	
	/// Returns a boolean value that represents whether the operation is executing or not.
	open override var isExecuting: Bool {
		return _executing
	}
	
	/// Returns a boolean value that represents whether the operation is finished or not.
	open override var isFinished: Bool {
		return _finished
	}
	
}

// MARK: - PauseableOperation

extension ConcurrentOperation: PauseableOperation {
	
	// MARK: Functions
	
	/// Pause the operation.
	///
	/// - Note: Must be overridend by subclass to get a custom pause action.
	public func pause() {
		_executing = false
	}

}

// MARK: - ResumeableOperation

extension ConcurrentOperation: ResumeableOperation {
	
	// MARK: Functions
	
	/// Resumes the execution of the operation.
	///
	/// - Note: Must be overridend by subclass to get a custom resume action.
	public func resume() {
		_executing = true
	}

}
