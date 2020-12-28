//
//  GroceryItemTests.swift
//  GroceryListUnitTests
//
//  Created by Sarah Lichter on 12/28/20.
//

import XCTest
@testable import GroceryList

class GroceryItemTests: XCTestCase {

    func testCreatingGroceryItem() {
        let itemName = "an item name"
        let item = GroceryItem(name: itemName)
        XCTAssertEqual(item.name, itemName)
        XCTAssertNotNil(item.id)
    }

    func testGroceryItemDataInitializesEmptyItemName() {
        let item = GroceryItem.Data()
        XCTAssert(item.name.isEmpty)
    }

    func testUpdateFromDataUpdatesItem() {
        let firstName = "first name"
        let updatedName = "A new name"
        var data: GroceryItem.Data = GroceryItem.Data()
        var groceryItem = GroceryItem(name: firstName)

        XCTAssertEqual(groceryItem.name, firstName)

        data.name = updatedName
        groceryItem.update(from: data)

        XCTAssertEqual(groceryItem.name, updatedName)
    }

}
