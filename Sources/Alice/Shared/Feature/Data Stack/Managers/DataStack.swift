//
//  DataStack.swift
//  Alice
//
//  Created by Javier Cicchelli on 17/04/2019.
//

import CoreData

/// This class simplifies the creation and management of multiple Core Data stack by handling the creation of the `NSPersistentContainer` instances.
public class DataStack {
	
	// MARK: Properties
	
	/// Dictionary which uses models keys and initialized containers as values.
	internal var containers: [Model : NSPersistentContainer]
	
	// MARK: Initializers
	
	/// Default initializer that returns an instance with an empty containers dictionary.
	init() {
		containers = [:]
	}
	
	// MARK: Static
	
	/// Returns the `DataStack` manager instance or singleton.
	public static let shared = DataStack()

	// MARK: Functions

	/// Adds a container.
	///
	/// - Parameters:
	///   - model: The model to be added.
	///   - type: The store type of the model to be added.
	///   - bundle: the bundle in which the model to be added is located.
	///   - descriptions: the descriptions to attach to the model to be added.
	/// - Returns: The `DataStack` manager instance or singleton.
	/// - Throws: A `DataStackError` error in case something went wrong while adding a container.
	@discardableResult
	public func add(_ model: Model,
					ofType type: Store,
					fromBundle bundle: Bundle,
					withDescriptions descriptions: [NSPersistentStoreDescription] = []) throws -> Self {
		guard !model.value.isEmpty else {
			throw DataStackError.containerNameIsEmpty
		}
		guard !containers.keys.contains(model) else {
			throw DataStackError.containerNameExists
		}
		guard let url = bundle.url(forResource: model.value,
								   withExtension: "momd") else {
			throw DataStackError.objectModelNotFound
		}
		guard let objectModel = NSManagedObjectModel(contentsOf: url) else {
			throw DataStackError.objectModelNotCreated
		}
		
		let container = NSPersistentContainer(name: model.value,
											  managedObjectModel: objectModel)
		
		container.persistentStoreDescriptions = !descriptions.isEmpty ? descriptions : [.makeDefault(forModel: model,
																									 ofType: type)]

		container.loadPersistentStores { storeDescription, error in
			if let error = error as NSError? {
				// TODO: Throw the error back to the caller.
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
			else {
				self.containers[model] = container
			}
		}
		
		return self
	}

	/// Removes a container.
	///
	/// - Parameter model: The model in which a container has been initialized.
	/// - Returns: The `DataStack` manager instance or singleton.
	/// - Throws: A `DataStackError` error in case something went wrong while removing a container.
	@discardableResult
	public func remove(_ model: Model) throws -> Self {
		guard !model.value.isEmpty else {
			throw DataStackError.containerNameIsEmpty
		}
		guard containers.keys.contains(model) else {
			throw DataStackError.containerNameNotExists
		}
		guard let container = containers[model] else {
			throw DataStackError.containerNotFound
		}
		
		let coordinator = container.persistentStoreCoordinator

		try coordinator.persistentStores.forEach { store in
			guard let url = store.url else {
				throw DataStackError.storeUrlNotFound
			}
			
			try coordinator.remove(store)
			
			if store.type != NSInMemoryStoreType {
				var urls = [url.path]
				
				if store.type == NSSQLiteStoreType {
					urls += ["\(url.path)-shm"]
					urls += ["\(url.path)-wal"]
				}
				
				try urls.forEach {
					try FileManager.default.removeItem(atPath: $0)
				}
			}
		}

		containers[model] = nil
		
		return self
	}
	
	/// Retrieves a requested `NSManagedObjectContext` instance from a container.
	///
	/// - Parameters:
	///   - type: The type of `NSManagedObjectContext` instance to retrieve.
	///   - model: The model to find in the containers.
	/// - Returns: A requested `NSManagedObjectContext` instance.
	/// - Throws: A `DataStackError` error in case something went while retrieving a context.
	public func getContext(ofType type: NSManagedObjectContext.Kind,
						   fromModel model: Model) throws -> NSManagedObjectContext {
		guard !model.value.isEmpty else {
			throw DataStackError.containerNameIsEmpty
		}
		guard containers.keys.contains(model) else {
			throw DataStackError.containerNameNotExists
		}
		
		let context = try self.context(ofType: type,
									   forModel: model)
		
		context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
		context.undoManager = nil
		context.shouldDeleteInaccessibleFaults = true
		context.automaticallyMergesChangesFromParent = true

		return context
	}

	/// Saves the unsaved context in all the containers.
	///
	/// - Throws: An `Erro` error in case something went wrong while saving the context of the containers.
	public func save() throws {
		try containers.forEach { name, container in
			let context = container.viewContext
			
			if context.hasChanges {
				try context.save()
			}
		}
	}

	/// Checks if a container associated with a model has been previously added.
	///
	/// - Parameter model: The model of the container to check.
	/// - Returns: A `Bool` instance which represents whether the container is initialized or not.
	public func isAdded(_ model: Model) -> Bool {
		return containers.keys.contains(model)
	}
	
	// MARK: Helpers
	
	private func context(ofType type: NSManagedObjectContext.Kind,
						 forModel model: Model) throws -> NSManagedObjectContext {
		if type == .foreground {
			guard let context = containers[model]?.viewContext else {
				throw DataStackError.contextNotFound
			}
			
			return context
		}
		else {
			guard let context = containers[model]?.newBackgroundContext() else {
				throw DataStackError.contextNotCreated
			}
			
			return context
		}
	}
	
}
