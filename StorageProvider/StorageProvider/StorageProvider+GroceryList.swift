//
//  StorageProvider+GroceryList.swift
//  StorageProvider
//
//  Created by Sarah Lichter on 1/13/21.
//

import CoreData


public extension StorageProvider {
    
    func createGroceryList(named name: String, in context: NSManagedObjectContext) {
        context.performAndWait {
          let groceryList = GroceryList(context: context)
          groceryList.storeName = name

          do {
            try context.save()
          } catch {
            context.rollback()
          }
        }
    }
    
}


public extension StorageProvider {
    func getAllGroceryLists(in context: NSManagedObjectContext) -> [GroceryList] {
    let fetchRequest: NSFetchRequest<GroceryList> = GroceryList.fetchRequest()

    do {
      return try persistentContainer.viewContext.fetch(fetchRequest)
    } catch {
      print("Failed to fetch Grocery Lists: \(error)")
      return []
    }
  }
}
