//
//  TestHelpers.swift
//  Tests iOS
//
//  Created by Sarah Lichter on 12/29/20.
//

import Foundation
import XCTest


func enterTextInTextField(text: String, textField: XCUIElement) {
    textField.tap()
    textField.typeText(text)
}


func clearItems(tablesQuery: XCUIElementQuery) {
    while tablesQuery.count > 0 {
        tablesQuery.element(boundBy: 0).swipeLeft()
        tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
    }
}
