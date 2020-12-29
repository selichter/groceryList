//
//  GroceryListsView.swift
//  Tests iOS
//
//  Created by Sarah Lichter on 12/24/20.
//

import XCTest

class GroceryListsView: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        app.launch()
    }

    func testGroceryListsTitleIsDisplayed() throws {
        XCTAssert(app.navigationBars.staticTexts["Grocery Lists"].exists)
    }

    func testHardcodedGroceryListNamesAreDisplayed() {
        XCTAssert(app.buttons["Trader Joe's"].exists)
        XCTAssert(app.buttons["Target"].exists)
        XCTAssert(app.buttons["Aldi"].exists)
    }

    func testTappingOnStoreNameNavigatesToThatList() {
        app.buttons["Aldi"].tap()

        XCTAssert(app.navigationBars.staticTexts["Aldi"].exists)
        XCTAssert(app.navigationBars.buttons["Grocery Lists"].exists)
        XCTAssert(app.navigationBars.buttons["plus"].exists)

        XCTAssert(app.staticTexts["Apples"].exists)
        XCTAssert(app.staticTexts["Kale"].exists)
        XCTAssert(app.staticTexts["Grapes"].exists)
    }

    func testAddNewItemToGroceryList() {
        let newItem = "something"
        app.buttons["Aldi"].tap()
        app.navigationBars.buttons["plus"].tap()

        let textField = app.textFields.firstMatch

        XCTAssertEqual(textField.placeholderValue, "Item Name")

        textField.tap()
        textField.typeText(newItem)
        app.navigationBars.buttons["Add"].tap()
        XCTAssert(app.staticTexts[newItem].exists)
    }

    func testAddNewGroceryList() {
        let newStore = "Store"
        app.navigationBars.buttons["plus"].tap()

        let textField = app.textFields.firstMatch

        XCTAssertEqual(textField.placeholderValue, "Store Name")
        textField.tap()
        textField.typeText(newStore)
        app.navigationBars.buttons["Add"].tap()
        XCTAssert(app.buttons[newStore].exists)
    }

}
