//
//  GroceryItemTests.swift
//  Tests iOS
//
//  Created by Sarah Lichter on 12/29/20.
//

import XCTest

class GroceryItemTests: XCTestCase {
    let app = XCUIApplication()
    let itemName = "Some Item"
    let listName = "Aldi"
    let itemNotes = "Sample Notes"
    

    override func setUpWithError() throws {
        app.launch()
        let tablesQuery = app.tables.cells
        clearItems(tablesQuery: tablesQuery)
        app.navigationBars.buttons["plus"].tap()
        enterTextInTextField(text: listName, textField: app.textFields["storeName"])

        app.navigationBars.buttons["Add"].tap()
    }
    
    
    func testDismissNewGroceryItem() {
        app.buttons[listName].tap()
        app.navigationBars.buttons["plus"].tap()

        enterTextInTextField(text: itemName, textField: app.textFields["Item Name"])
        enterTextInTextField(text: itemNotes, textField: app.textFields["Notes"])
        
        app.navigationBars.buttons["Dismiss"].tap()
        XCTAssertFalse(app.staticTexts[itemName].exists)
    }
    
    func testAddNewGroceryItem() {
        app.buttons[listName].tap()
        app.navigationBars.buttons["plus"].tap()

        enterTextInTextField(text: itemName, textField: app.textFields["Item Name"])
        
        app.buttons["Store Section"].tap()
        app.buttons["Produce"].tap()
        
        enterTextInTextField(text: itemNotes, textField: app.textFields["Notes"])
        
        app.navigationBars.buttons["Add"].tap()
        XCTAssert(app.staticTexts[itemName].exists)
        
        let tablesQuery = app.tables.cells
        
        let cell = tablesQuery.element(boundBy: 0)
        cell.waitForExistence(timeout: 2)
        
        XCTAssertEqual(cell.label, "Some Item, Produce, Sample Notes")
    }
        let tablesQuery = app.tables.cells
        XCTAssert(app.staticTexts[itemNotes].exists)
    }

}
