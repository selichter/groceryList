//
//  StorageProvider.swift
//  StorageProvider
//
//  Created by Sarah Lichter on 1/12/21.
//

import CoreData


public class PersistentContainer: NSPersistentContainer {}

public class StorageProvider {

  static var managedObjectModel: NSManagedObjectModel = {
    let bundle = Bundle(for: StorageProvider.self)

    guard let url = bundle.url(forResource: "GroceryStorage", withExtension: "momd") else {
      fatalError("Failed to locate momd file for GroceryStorage")
    }

    guard let model = NSManagedObjectModel(contentsOf: url) else {
      fatalError("Failed to load momd file for GroceryStorage")
    }

    return model
  }()

  public let persistentContainer: PersistentContainer

  public init(storeType: StoreType = .persisted) {
    persistentContainer = PersistentContainer(name: "GroceryStorage", managedObjectModel: Self.managedObjectModel)

    if storeType == .inMemory {
      persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }

    persistentContainer.loadPersistentStores(completionHandler: { description, error in

      if let error = error {
        fatalError("Core Data store failed to load with error: \(error)")
      }
    })
  }
}

public enum StoreType {
  case inMemory, persisted
}
