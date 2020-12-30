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
