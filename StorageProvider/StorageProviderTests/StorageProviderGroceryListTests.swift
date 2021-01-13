//
//  StorageProviderTests.swift
//  StorageProviderTests
//
//  Created by Sarah Lichter on 1/12/21.
//

import XCTest
import CoreData
@testable import StorageProvider

class StorageProviderGroceryListTests: XCTestCase {
    var storageProvider: StorageProvider = StorageProvider(storeType: .inMemory)

    override func setUpWithError() throws {
      storageProvider = StorageProvider(storeType: .inMemory)
    }

    
    func testGroceryListPersistsNewList() throws {
        let request: NSFetchRequest<GroceryList> = GroceryList.fetchRequest()

        let context = storageProvider.persistentContainer.viewContext
        let initialCount = try context.count(for: request)
        XCTAssertEqual(initialCount, 0)

        storageProvider.createGroceryList(named: "Test item",
                                      in: context)

        let finalCount = try context.count(for: request)
        XCTAssertEqual(finalCount, 1)
    }

    func testGetAllReturnsAllLists() throws {
        let context = storageProvider.persistentContainer.viewContext
        
        context.performAndWait {
          let groceryList = GroceryList(context: context)
          groceryList.storeName = "Test List"

          do {
            try context.save()
          } catch {
            XCTFail()
          }
        }
        
        let results = storageProvider.getAllGroceryLists(in: context)

        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results.first?.storeName, "Test List")
    }
}
