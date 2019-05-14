//
//  OperationState.swift
//  Alice
//
//  Created by Javier Cicchelli on 13/05/2019.
//

import Foundation

extension Operation {
	
	// MARK: Enumerations
	
	/// Enumeration that represents the state in which an `Operation` can be.
	///
	/// - ready: the operation is ready to execute.
	/// - executing: the operation is currently in execution.
	/// - paused: the operation execution is paused.
	/// - finished: the operation execution is finished.
	@objc(OperationState)
	public enum State: Int {
		case ready
		case executing
		case paused
		case finished
	}
	
}
