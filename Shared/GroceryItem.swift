//
//  GroceryItem.swift
//  GroceryList
//
//  Created by Sarah Lichter on 12/27/20.
//

import Foundation

struct GroceryItem: Identifiable {
    let id = UUID()
    var name: String
}

extension GroceryItem {
    struct Data {
        var name: String = ""
    }

    var data: Data {
        return Data(name: name)
    }

    mutating func update(from data: Data) {
        name = data.name
    }
}
