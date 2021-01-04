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
        let size = "1"
        let amount = "Cup"
        let item = GroceryItem(name: itemName,
                               storeSection: .baking,
                               notes: notes,
                               amount: amount,
                               size: size)

        XCTAssertNotNil(item.id)
        XCTAssertEqual(item.name, itemName)
        XCTAssertEqual(item.storeSection, .baking)
        XCTAssertEqual(item.notes, notes)
        XCTAssertEqual(item.amount, amount)
        XCTAssertEqual(item.size, size)
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
        let firstSize = "1"
        let firstAmount = "Cup"

        var data: GroceryItem.Data = GroceryItem.Data()
        var groceryItem = GroceryItem(name: firstName,
                                      storeSection: firstSection,
                                      notes: firstNotes,
                                      amount: firstAmount,
                                      size: firstSize)

        XCTAssertEqual(groceryItem.name, firstName)
        XCTAssertEqual(groceryItem.storeSection, firstSection)
        XCTAssertEqual(groceryItem.notes, firstNotes)
        XCTAssertEqual(groceryItem.amount, firstAmount)
        XCTAssertEqual(groceryItem.size, firstSize)

        let updatedName = "A new name"
        let updatedSection = StoreSection.meat
        let updatedNotes = "updated notes"

        data.name = updatedName
        data.storeSection = updatedSection
        data.notes = updatedNotes
        data.amount = firstAmount
        data.size = firstSize
        groceryItem.update(from: data)

        XCTAssertEqual(groceryItem.name, updatedName)
        XCTAssertEqual(groceryItem.storeSection, updatedSection)
        XCTAssertEqual(groceryItem.notes, updatedNotes)
        XCTAssertEqual(groceryItem.amount, firstAmount)
        XCTAssertEqual(groceryItem.size, firstSize)
    }

}
