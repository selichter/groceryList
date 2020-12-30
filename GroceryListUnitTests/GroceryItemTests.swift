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
        let notes = "some notes here"
        let item = GroceryItem(name: itemName,
                               storeSection: .baking,
                               notes: notes)

        XCTAssertNotNil(item.id)
        XCTAssertEqual(item.name, itemName)
        XCTAssertEqual(item.storeSection, .baking)
        XCTAssertEqual(item.notes, notes)
    }

    func testGroceryItemDataInitializesEmptyItemName() {
        let item = GroceryItem.Data()
        XCTAssertTrue(item.name.isEmpty)
        XCTAssertEqual(item.storeSection.rawValue, "")
        XCTAssertTrue(item.notes.isEmpty)
    }

    func testUpdateFromDataUpdatesItem() {
        let firstName = "first name"
        let firstSection = StoreSection.produce
        let firstNotes = "first notes"

        var data: GroceryItem.Data = GroceryItem.Data()
        var groceryItem = GroceryItem(name: firstName,
                                      storeSection: firstSection,
                                      notes: firstNotes)

        XCTAssertEqual(groceryItem.name, firstName)
        XCTAssertEqual(groceryItem.storeSection, firstSection)
        XCTAssertEqual(groceryItem.notes, firstNotes)

        let updatedName = "A new name"
        let updatedSection = StoreSection.meat
        let updatedNotes = "updated notes"

        data.name = updatedName
        data.storeSection = updatedSection
        data.notes = updatedNotes
        groceryItem.update(from: data)

        XCTAssertEqual(groceryItem.name, updatedName)
        XCTAssertEqual(groceryItem.storeSection, updatedSection)
        XCTAssertEqual(groceryItem.notes, updatedNotes)
    }

}
