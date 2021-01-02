//
//  GroceryListsView.swift
//  Tests iOS
//
//  Created by Sarah Lichter on 12/24/20.
//

import XCTest

class GroceryListsView: XCTestCase {
    let app = XCUIApplication()
    let newStore = "Store"

    override func setUpWithError() throws {
        app.launch()
        
        let tablesQuery = app.tables.cells
        clearItems(tablesQuery: tablesQuery)

    }
    
    override func tearDown() {
        let tablesQuery = app.tables.cells
        clearItems(tablesQuery: tablesQuery)
    }

    func testGroceryListsTitleIsDisplayed() throws {
        XCTAssert(app.navigationBars.staticTexts["Grocery Lists"].exists)
    }

    func testAddNewGroceryList() {
        app.navigationBars.buttons["plus"].tap()
        
        enterTextInTextField(text: newStore, textField: app.textFields["storeName"])
        app.navigationBars.buttons["Add"].tap()
        
        XCTAssert(app.buttons[newStore].exists)
        XCTAssertEqual(app.tables.cells.firstMatch.label, "Store, 0 items")
    }

    func testDismissNewGroceryList() {
        app.navigationBars.buttons["plus"].tap()

        enterTextInTextField(text: "different place", textField: app.textFields["storeName"])
        app.navigationBars.buttons["Dismiss"].tap()
        
        XCTAssertFalse(app.buttons["different place"].exists)
    }
    
    func testAddingMultipleGroceryLists() {
        app.navigationBars.buttons["plus"].tap()

        enterTextInTextField(text: newStore, textField: app.textFields["storeName"])
        app.navigationBars.buttons["Add"].tap()
        
        app.navigationBars.buttons["plus"].tap()
        
        enterTextInTextField(text: "Second Store", textField: app.textFields["storeName"])
        app.navigationBars.buttons["Add"].tap()
        
        XCTAssert(app.buttons[newStore].exists)
        XCTAssert(app.buttons["Second Store"].exists)
    }
    
}
