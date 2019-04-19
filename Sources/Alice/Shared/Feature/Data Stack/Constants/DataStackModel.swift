//
//  DataStackModel.swift
//  Alice
//
//  Created by Javier Cicchelli on 17/04/2019.
//

extension DataStack {

	// MARK: Constants
	
	/// Instances used by a `DataStack` manager defined as constants.
	public class Model: Value<String> {}
	
}

// MARK: - Hashable

extension DataStack.Model: Hashable {
	
	// MARK: Functions
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(value)
	}
	
}

// MARK: - Equatable

extension DataStack.Model: Equatable {
	
	// MARK: Static
	
	public static func == (lhs: DataStack.Model, rhs: DataStack.Model) -> Bool {
		return lhs.value == rhs.value
	}

}
