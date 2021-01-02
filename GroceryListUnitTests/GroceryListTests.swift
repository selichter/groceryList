//
//  GroceryListTests.swift
//  GroceryListUnitTests
//
//  Created by Sarah Lichter on 12/29/20.
//

import XCTest
@testable import GroceryList

class GroceryListTests: XCTestCase {

    func testCreatingGroceryList() {
        let storeName = "a store name"
        let list = GroceryList(storeName: storeName, items: [])

        XCTAssertEqual(list.storeName, storeName)
        XCTAssertNotNil(list.id)
        XCTAssertTrue(list.items.isEmpty)
    }

    func testGroceryIListDataInitializesEmptyList() {
        let list = GroceryList.Data()
        XCTAssertTrue(list.storeName.isEmpty)
        XCTAssertTrue(list.items.isEmpty)
    }

}
