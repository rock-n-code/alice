//
//  Value.swift
//  Alice
//
//  Created by Javier Cicchelli on 17/04/2019.
//

/// The type used to define a generic system of values, inspired by the `NSNotification.Name` type.
open class Value<T> {
	
	// MARK: Properties
	
	/// The persisted generic value.
	public let value: T
	
	// MARK: Initializers

	/// Persist a generic value.
	///
	/// - Parameter value: The generic value to persist.
	public init(_ value: T) {
		self.value = value
	}
	
}
