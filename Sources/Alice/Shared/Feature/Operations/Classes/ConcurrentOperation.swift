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
	
	private let queueName = #"com.rockncode.alice.shared.operation.state"#
	private let stateKey = #"state"#
	
	// MARK: Properties
	
	private let stateQueue: DispatchQueue
	
	internal var rawState: Operation.State
	
	@objc
	private dynamic var state: Operation.State {
		get {
			return stateQueue.sync(execute: {
				rawState
			})
		}
		set {
			willChangeValue(forKey: stateKey)
			
			stateQueue.sync(flags: .barrier) {
				rawState = newValue
			}
			
			didChangeValue(forKey: stateKey)
		}
	}
	
	// MARK: Initializers
	
	/// Default initializer.
	public override init() {
		self.stateQueue = DispatchQueue(label: queueName,
										attributes: .concurrent)
		self.rawState = .ready
	}
	
	// MARK: Functions
	
	/// Notifies the concurrent operation it will start its execution.
	///
	/// - Note: Must be called when the operation is ready to execute.
	public final func executing() {
		rawState = .executing
	}

	/// Notifies the completion of concurrent task and hence the completion of the operation.
	///
	/// - Note: Must be called when the operation is finished.
	public final func finish() {
		rawState = .finished
	}
	
	// MARK: Operation
	
	/// Sets the operation as asynchronous.
	public final override var isAsynchronous: Bool {
		return true
	}
	
	/// Returns a boolean value that represents whether the operation is ready or not.
	public final override var isReady: Bool {
		return rawState == .ready
			&& super.isReady
	}
	
	/// Returns a boolean value that represents whether the operation is executing or not.
	public final override var isExecuting: Bool {
		return rawState == .executing
	}
	
	/// Returns a boolean value that represents whether the operation is finished or not.
	public final override var isFinished: Bool {
		return rawState == .finished
	}
	
	// MARK: NSObject
	
	@objc
	private dynamic class func keyPathsForValuesAffectingIsReady() -> Set<String> {
		return ["state"]
	}
	
	@objc
	private dynamic class func keyPathsForValuesAffectingIsExecuting() -> Set<String> {
		return ["state"]
	}
	
	@objc
	private dynamic class func keyPathsForValuesAffectingIsFinished() -> Set<String> {
		return ["state"]
	}
	
}

// MARK: - PauseableOperation

extension ConcurrentOperation: PauseableOperation {
	
	// MARK: Functions
	
	/// Pause the operation.
	///
	/// - Note: Must be overridend by subclass to get a custom pause action.
	public final func pause() {
		rawState = .paused
	}

}

// MARK: - ResumeableOperation

extension ConcurrentOperation: ResumeableOperation {
	
	// MARK: Functions
	
	/// Resumes the execution of the operation.
	///
	/// - Note: Must be overridend by subclass to get a custom resume action.
	public final func resume() {
		rawState = .executing
	}

}
