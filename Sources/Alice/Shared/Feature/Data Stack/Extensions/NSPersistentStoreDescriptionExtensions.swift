//
//  NSPersistentStoreDescriptionExtensions.swift
//  Alice
//
//  Created by Javier Cicchelli on 17/04/2019.
//

import CoreData

extension NSPersistentStoreDescription {
	
	// MARK: Static
	
	internal static func makeDefault(forModel model: DataStack.Model,
									 ofType store: DataStack.Store) -> NSPersistentStoreDescription {
		let description = make(forModel: model,
							   ofType: store)
		
		description.configuration = "Default"
		description.isReadOnly = false
		description.shouldAddStoreAsynchronously = false
		description.shouldInferMappingModelAutomatically = true
		description.shouldMigrateStoreAutomatically = true
		
		return description
	}
	
	public static func make(forModel model: DataStack.Model,
							ofType store: DataStack.Store) -> NSPersistentStoreDescription {
		let description = NSPersistentStoreDescription()
		
		description.type = store.rawValue
		
		if store != .inMemory {
			let directory = NSPersistentContainer.defaultDirectoryURL()
			let pathComponent = "\(model.value).\(store.extensionValue)"

			description.url = directory.appendingPathComponent(pathComponent)
		}
		
		return description
	}
	
}
