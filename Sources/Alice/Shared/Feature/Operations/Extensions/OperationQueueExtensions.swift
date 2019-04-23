//
//  OperationQueueExtensions.swift
//  Alice
//
//  Created by Javier Cicchelli on 19/04/2019.
//

import Foundation

extension OperationQueue {
	
	// MARK: Initializers

	/// Creates an operation queue with name, maximum concurrent operations and quality of service defined.
	///
	/// - Parameters:
	///   - name: A name for the operation queue.
	///   - maxConcurrentOperationCount: The maximum concurrent operations the queue is allowed to perform.
	///   - qualityOfService: The quality of service to the operation executed in the queue.
	public convenience init(name: Name,
							maxConcurrentOperationCount: Int = OperationQueue.defaultMaxConcurrentOperationCount,
							qualityOfService: QualityOfService = .default) {
		self.init()
		
		self.name = name.value
		self.maxConcurrentOperationCount = maxConcurrentOperationCount
		self.qualityOfService = qualityOfService
	}
	
	// MARK: Functions

	/// Adds multiple operations to the queue at once.
	///
	/// - Parameter operations: An array of `Operation` objects that you want to add to the queue.
	/// - Note: The operations are added to the queue and control returns immediately to the caller.
	public func addOperations(_ operations: [Operation]) {
		operations.forEach { operation in
			addOperation(operation)
		}
	}

	/// Add a list of chained operations to the queue at once.
	///
	/// - Parameter operations: An array of `Operation` objects that you want to chain and add to the queue.
	/// - Note: The operations are added to the queue and control returns immediately to the caller.
	public func addChainedOperations(_ operations: [Operation]) {
		operations.enumerated().forEach { (index, operation) in
			if index > 0 {
				operation.addDependency(operations[index - 1])
			}
			
			addOperation(operation)
		}
	}
	
	/// Pause the queue.
	///
	/// - Note: This function will pause all operations that implemented the `PauseableOperation` protocol.
	public func pauseAllOperations() {
		isSuspended = true
		
		operations.forEach { operation in
			guard let pauseable = operation as? PauseableOperation else {
				return
			}
			
			pauseable.pause()
		}
	}
	
	/// Resume the queue.
	///
	/// - Note: This function will pause all operations that implemented the `ResumeableOperation` protocol.
	public func resumeAllOperations() {
		isSuspended = false
		
		operations.forEach { operation in
			guard let resumeable = operation as? ResumeableOperation else {
				return
			}
			
			resumeable.resume()
		}
	}
	
}

