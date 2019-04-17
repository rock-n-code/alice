//
//  NSManagedObjectContextKind.swift
//  Alice
//
//  Created by Javier Cicchelli on 18/04/2019.
//

import CoreData

extension NSManagedObjectContext {
	
	// MARK: Enumerations
	
	/// Representation of the possible types of context.
	public enum Kind {
		/// Foreground context
		case foreground
		/// Background context
		case background
	}
	
}
