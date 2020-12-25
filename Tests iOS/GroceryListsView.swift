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
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGroceryListsViewDisplaysStubText() throws {
        let stubText = app.staticTexts["stubViewTexts"].label
        XCTAssertEqual(stubText, "Grocery Lists View")
    }

}
