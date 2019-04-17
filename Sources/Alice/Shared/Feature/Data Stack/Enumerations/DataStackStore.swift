//
//  DataStackStore.swift
//  Alice
//
//  Created by Javier Cicchelli on 17/04/2019.
//

import CoreData

extension DataStack {

	/// Representation of the possible types of stores supported by the containers used in a `DataStack` instance.
	public enum Store {
		/// The SQLite database store type.
		case sql
		/// The XML store type.
		case xml
		/// The binary store type.
		case binary
		/// The in-memory store type.
		case inMemory
		
		// MARK: Properties
		
		/// Gets the associated value from the selected case.
		var rawValue: String {
			switch self {
			case .sql:
				return NSSQLiteStoreType
			case .xml:
				#if os(macOS)
				return NSXMLStoreType
				#else
				return NSSQLiteStoreType
				#endif
			case .binary:
				return NSBinaryStoreType
			case .inMemory:
				return NSInMemoryStoreType
			}
		}
		
		/// Gets the associated file extension value from the selected case.
		var extensionValue: String {
			switch self {
			case .sql:
				return "sqlite"
			case .xml:
				#if os(macOS)
				return "xml"
				#else
				return ""
				#endif
			case .binary:
				return "bin"
			case .inMemory:
				return ""
			}
		}

	}
	
}
