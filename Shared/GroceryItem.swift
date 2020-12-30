//
//  GroceryItem.swift
//  GroceryList
//
//  Created by Sarah Lichter on 12/27/20.
//

import Foundation
import SwiftUI

// UPDATE TESTS

struct GroceryItem: Identifiable {
    let id = UUID()
    var name: String
    var storeSection: StoreSection
    var notes: String
}

extension GroceryItem {
    struct Data {
        var name: String = ""
        var storeSection = StoreSection.empty
        var notes = ""
    }

    var data: Data {
        return Data(name: name,
                    storeSection: storeSection,
                    notes: notes)
    }

    mutating func update(from data: Data) {
        name = data.name
        storeSection = data.storeSection
        notes = data.notes
    }
}

enum StoreSection: String, Equatable, CaseIterable {
    case produce = "Produce"
    case dairy = "Dairy"
    case meat = "Meat"
    case freezer = "Freezer"
    case snacks = "Snacks"
    case baking = "Baking"
    case shelfStable = "Shelf Stable"
    case empty = ""

    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
