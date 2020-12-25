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
        XCTAssert(app.staticTexts["Trader Joe's"].exists)
        XCTAssert(app.staticTexts["Target"].exists)
        XCTAssert(app.staticTexts["Aldi"].exists)
    }

}
